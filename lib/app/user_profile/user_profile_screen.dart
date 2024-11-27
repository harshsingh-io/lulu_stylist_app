import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Assuming you're using GoRouter for navigation
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserUpdateRequestModel? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  /// Loads user data from SharedPreferences
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userDetails');

    if (userDataJson != null && userDataJson.isNotEmpty) {
      final userData = json.decode(userDataJson) as Map<String, dynamic>;
      setState(() {
        user = UserUpdateRequestModel.fromJson(userData);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  /// Handles Firebase logout and navigates to Onboarding screen
  Future<void> _logout() async {
    try {
      // await FirebaseAuth.instance.signOut();
      // Optionally, clear SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('userDetails');
      // Navigate to Onboarding screen
      GoRouter.of(context).go('/onboarding');
    } catch (e) {
      // Handle logout error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error logging out. Please try again.')),
      );
    }
  }

  /// Confirms logout action with the user
  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content:
              const Text('Are you sure you want to logout from your account?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: LuluBrandColor.brandPrimary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _logout();
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: LuluBrandColor.brandRed),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Helper method to determine and return the correct ImageProvider
  ImageProvider _getProfileImageProvider(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      // If no image selected, show placeholder asset image
      return const AssetImage('assets/images/default.jpg');
    } else if (imagePath.startsWith('assets/')) {
      // If imagePath starts with 'assets/', load as asset
      return AssetImage(imagePath);
    } else {
      // Otherwise, assume it's a local file path
      final file = File(imagePath);
      if (file.existsSync()) {
        return FileImage(file);
      } else {
        // If file doesn't exist, show placeholder
        return const AssetImage('assets/images/default.jpg');
      }
    }
  }

  /// Builds the user profile picture widget without the camera icon
  Widget _buildUserProfilePicture() {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey[300],
        backgroundImage: _getProfileImageProvider(user!.profileImagePath),
        child: user!.profileImagePath == null || user!.profileImagePath!.isEmpty
            ? const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              )
            : null,
      ),
    );
  }

  /// Builds a section card with title and content
  Widget _buildSectionCard(String title, Widget content) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _getSectionIcon(title),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: LuluBrandColor.brandPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  /// Returns an icon based on the section title
  Icon _getSectionIcon(String title) {
    switch (title) {
      case 'User Details':
        return const Icon(Icons.person, color: LuluBrandColor.brandPrimary);
      case 'Body Measurements':
        return const Icon(Icons.straighten, color: LuluBrandColor.brandPrimary);
      case 'Style Preferences':
        return const Icon(Icons.style, color: LuluBrandColor.brandPrimary);
      case 'User Preferences':
        return const Icon(Icons.settings, color: LuluBrandColor.brandPrimary);
      default:
        return const Icon(Icons.info, color: LuluBrandColor.brandPrimary);
    }
  }

  /// Builds the user details section
  Widget _buildUserDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Name', user!.userDetails.name),
        _buildDetailRow('Age', user!.userDetails.age.toString()),
        if (user!.userDetails.gender != null)
          _buildDetailRow('Gender', user!.userDetails.gender!),
        if (user!.userDetails.locationLat != null &&
            user!.userDetails.locationLong != null)
          _buildDetailRow(
            'Location',
            user!.userDetails.locationLat! + user!.userDetails.locationLong!,
          ),
      ],
    );
  }

  /// Builds the body measurements section
  Widget _buildBodyMeasurements() {
    final bodyMeasurements = user!.userDetails.bodyMeasurements;
    if (bodyMeasurements == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Height', '${bodyMeasurements.height} cm'),
        _buildDetailRow('Weight', '${bodyMeasurements.weight} kg'),
        if (bodyMeasurements.bodyType != null)
          _buildDetailRow('Body Type', bodyMeasurements.bodyType!),
      ],
    );
  }

  /// Builds the style preferences section
  Widget _buildStylePreferences() {
    final stylePreferences = user!.userDetails.stylePreferences;
    if (stylePreferences == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          'Favorite Colors',
          stylePreferences.favoriteColors.join(', '),
        ),
        _buildDetailRow(
          'Preferred Brands',
          stylePreferences.preferredBrands.join(', '),
        ),
        _buildDetailRow(
          'Lifestyle Choices',
          stylePreferences.lifestyleChoices.join(', '),
        ),
        _buildDetailRow(
          'Budget',
          'Min - \$${stylePreferences.budget.min}, Max - \$${stylePreferences.budget.max}',
        ),
        _buildDetailRow(
          'Shopping Frequency',
          stylePreferences.shoppingHabits.frequency,
        ),
        _buildDetailRow(
          'Preferred Retailers',
          stylePreferences.shoppingHabits.preferredRetailers.join(', '),
        ),
      ],
    );
  }

  /// Builds the user preferences section
  Widget _buildUserPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          'Receive Notifications',
          user!.preferences.receiveNotifications ? 'Yes' : 'No',
        ),
        _buildDetailRow(
          'Allow Data Sharing',
          user!.preferences.allowDataSharing ? 'Yes' : 'No',
        ),
      ],
    );
  }

  /// Builds a single detail row with label and value
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  /// Builds the floating action button for editing profile
  Widget _buildEditProfileButton() {
    return FloatingActionButton(
      onPressed: () {
        // Navigate to edit profile screen
        GoRouter.of(context).go('/edit-profile');
      },
      backgroundColor: LuluBrandColor.brandPrimary,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: LuluBrandColor.brandPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Logout',
            onPressed: _confirmLogout,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : user == null
              ? const Center(
                  child: Text(
                    'No user data available.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUserProfilePicture(),
                      const SizedBox(height: 24),
                      _buildSectionCard('User Details', _buildUserDetails()),
                      const SizedBox(height: 16),
                      _buildSectionCard(
                        'Body Measurements',
                        _buildBodyMeasurements(),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionCard(
                        'Style Preferences',
                        _buildStylePreferences(),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionCard(
                        'User Preferences',
                        _buildUserPreferences(),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Navigate to edit profile screen
                            GoRouter.of(context).go('/edit-profile');
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit Profile'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LuluBrandColor.brandPrimary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      floatingActionButton: _buildEditProfileButton(),
    );
  }
}
