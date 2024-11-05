import 'package:flutter/material.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_event.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('userDetails');

    if (userDataJson != null) {
      Map<String, dynamic> userData =
          json.decode(userDataJson) as Map<String, dynamic>;
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

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Center(
          child: Text('No user data available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: LuluBrandColor.brandPrimary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Call the logout event
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserProfilePicture(),
            SizedBox(height: 16.0),
            _buildSectionCard('User Details', _buildUserDetails()),
            SizedBox(height: 16.0),
            _buildSectionCard('Body Measurements', _buildBodyMeasurements()),
            SizedBox(height: 16.0),
            _buildSectionCard('Style Preferences', _buildStylePreferences()),
            SizedBox(height: 16.0),
            _buildSectionCard('User Preferences', _buildUserPreferences()),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to edit profile screen or handle edit functionality
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: LuluBrandColor.brandPrimary,
      ),
    );
  }

  Widget _buildUserProfilePicture() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/user_placeholder.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.camera_alt, color: LuluBrandColor.brandPrimary),
              onPressed: () {
                // Handle profile picture edit
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, Widget content) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info, color: LuluBrandColor.brandPrimary),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: LuluBrandColor.brandPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Name', user!.userDetails.name),
        _buildDetailRow('Age', user!.userDetails.age.toString()),
        if (user!.userDetails.gender != null)
          _buildDetailRow('Gender', user!.userDetails.gender!),
        if (user!.userDetails.location != null)
          _buildDetailRow('Location', user!.userDetails.location!),
      ],
    );
  }

  Widget _buildBodyMeasurements() {
    final bodyMeasurements = user!.userDetails.bodyMeasurements;
    if (bodyMeasurements == null) return SizedBox.shrink();

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

  Widget _buildStylePreferences() {
    final stylePreferences = user!.userDetails.stylePreferences;
    if (stylePreferences == null) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
            'Favorite Colors', stylePreferences.favoriteColors.join(', ')),
        _buildDetailRow(
            'Preferred Brands', stylePreferences.preferredBrands.join(', ')),
        _buildDetailRow(
            'Lifestyle Choices', stylePreferences.lifestyleChoices.join(', ')),
        _buildDetailRow('Budget',
            'Min - \$${stylePreferences.budget.min}, Max - \$${stylePreferences.budget.max}'),
        _buildDetailRow(
            'Shopping Frequency', stylePreferences.shoppingHabits.frequency),
        _buildDetailRow('Preferred Retailers',
            stylePreferences.shoppingHabits.preferredRetailers.join(', ')),
      ],
    );
  }

  Widget _buildUserPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Receive Notifications',
            user!.preferences.receiveNotifications ? "Yes" : "No"),
        _buildDetailRow('Allow Data Sharing',
            user!.preferences.allowDataSharing ? "Yes" : "No"),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
