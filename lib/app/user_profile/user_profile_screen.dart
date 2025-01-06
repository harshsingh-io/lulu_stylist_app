import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/bloc/user_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/user_repository.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepository: UserRepository(baseUrl: apiBase),
        authBloc: context.read<AuthenticationBloc>(),
      )..add(const UserEvent.fetchUserData()),
      child: const UserProfileView(),
    );
  }
}

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  void _confirmLogout(BuildContext context) {
    showDialog<void>(
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
                context.read<AuthenticationBloc>().add(
                      const AuthenticationEvent.logoutRequested(),
                    );
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

  Widget _buildProfileContent(BuildContext context, UserModel user) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserBloc>().add(const UserEvent.fetchUserData());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserProfilePicture(user),
            const SizedBox(height: 24),
            if (user.userDetails != null) ...[
              _buildSectionCard(
                'User Details',
                _buildUserDetails(user),
                Icons.person,
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                'Body Measurements',
                _buildBodyMeasurements(user),
                Icons.straighten,
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                'Style Preferences',
                _buildStylePreferences(user),
                Icons.style,
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                'User Preferences',
                _buildUserPreferences(user),
                Icons.settings,
              ),
            ] else ...[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Profile details not available',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          GoRouter.of(context).pushNamed(updateUserProfile),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LuluBrandColor.brandPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Update Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfilePicture(UserModel user) {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey[300],
        backgroundImage: _getProfileImageProvider(user.profileImageUrl),
        child: user.profileImageUrl == null || user.profileImageUrl!.isEmpty
            ? const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              )
            : null,
      ),
    );
  }

  ImageProvider _getProfileImageProvider(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const AssetImage('assets/images/default.jpg');
    } else if (imagePath.startsWith('assets/')) {
      return AssetImage(imagePath);
    } else {
      final file = File(imagePath);
      if (file.existsSync()) {
        return FileImage(file);
      } else {
        return const AssetImage('assets/images/default.jpg');
      }
    }
  }

  Widget _buildSectionCard(String title, Widget content, IconData icon) {
    return Card(
      color: LuluBrandColor.brandWhite,
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
                Icon(icon, color: LuluBrandColor.brandPrimary),
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

  Widget _buildUserDetails(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Name', user.userDetails!.name),
        _buildDetailRow('Age', user.userDetails!.age.toString()),
        if (user.userDetails!.gender != null)
          _buildDetailRow('Gender', user.userDetails!.gender!),
        if (user.userDetails!.locationLat != null)
          _buildDetailRow('Location', user.userDetails!.locationLat!),
      ],
    );
  }

  Widget _buildBodyMeasurements(UserModel user) {
    final measurements = user.userDetails!.bodyMeasurements;
    if (measurements == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Height', '${measurements.height} cm'),
        _buildDetailRow('Weight', '${measurements.weight} kg'),
        if (measurements.bodyType != null)
          _buildDetailRow('Body Type', measurements.bodyType!),
      ],
    );
  }

  Widget _buildStylePreferences(UserModel user) {
    final preferences = user.userDetails!.stylePreferences;
    if (preferences == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          'Favorite Colors',
          preferences.favoriteColors.join(', '),
        ),
        _buildDetailRow(
          'Preferred Brands',
          preferences.preferredBrands.join(', '),
        ),
        _buildDetailRow(
          'Lifestyle Choices',
          preferences.lifestyleChoices.join(', '),
        ),
        _buildDetailRow(
          'Budget',
          'Min - \$${preferences.budget.minAmount}, Max - \$${preferences.budget.maxAmount}',
        ),
        _buildDetailRow(
          'Shopping Frequency',
          preferences.shoppingHabits.frequency,
        ),
        _buildDetailRow(
          'Preferred Retailers',
          preferences.shoppingHabits.preferredRetailers.join(', '),
        ),
      ],
    );
  }

  Widget _buildUserPreferences(UserModel user) {
    if (user.userPreferences == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          'Receive Notifications',
          user.userPreferences!.receiveNotifications ? 'Yes' : 'No',
        ),
        _buildDetailRow(
          'Allow Data Sharing',
          user.userPreferences!.allowDataSharing ? 'Yes' : 'No',
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          failure: (message) {
            // Only show snackbar for authentication-related errors
            if (message == 'Authentication token not found' ||
                message == 'Session expired' ||
                message == 'Invalid credentials') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
              if (message == 'Session expired') {
                context.read<AuthenticationBloc>().add(
                      const AuthenticationEvent.sessionExpired(),
                    );
              }
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: LuluBrandColor.brandWhite,
          appBar: AppBar(
            title: const Text(
              'User Profile',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: LuluBrandColor.brandPrimary,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                tooltip: 'Logout',
                onPressed: () => _confirmLogout(context),
              ),
            ],
          ),
          body: state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: LuluBrandColor.brandPrimary,
              ),
            ),
            loaded: (userData) {
              if (userData.userDetails != null) {
                return _buildProfileContent(context, userData);
              } else {
                // Show empty state with update button for new users
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildUserProfilePicture(
                          userData), // Show profile picture even if details are empty
                      const SizedBox(height: 24),
                      const Text(
                        'Complete Your Profile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: LuluBrandColor.brandPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tell us more about yourself to get personalized recommendations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () =>
                            GoRouter.of(context).pushNamed(updateUserProfile),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LuluBrandColor.brandPrimary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        child: const Text(
                          'Complete Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            failure: (message) {
              // Only show error state for authentication failures
              if (message == 'Authentication token not found' ||
                  message == 'Session expired' ||
                  message == 'Invalid credentials') {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: LuluBrandColor.brandRed,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        message,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context
                            .read<UserBloc>()
                            .add(const UserEvent.fetchUserData()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LuluBrandColor.brandPrimary,
                        ),
                        child: const Text(
                          'Retry',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // For non-authentication failures, show empty state
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Complete Your Profile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: LuluBrandColor.brandPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            GoRouter.of(context).pushNamed(updateUserProfile),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LuluBrandColor.brandPrimary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        child: const Text(
                          'Complete Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            orElse: () => const Center(
              child: CircularProgressIndicator(
                color: LuluBrandColor.brandPrimary,
              ),
            ),
          ),
          floatingActionButton: state.maybeWhen(
            loaded: (userData) => userData.userDetails != null
                ? FloatingActionButton(
                    onPressed: () =>
                        GoRouter.of(context).pushNamed(updateUserProfile),
                    backgroundColor: LuluBrandColor.brandPrimary,
                    child: const Icon(Icons.edit, color: Colors.white),
                  )
                : null,
            orElse: () => null,
          ),
        );
      },
    );
  }
}
