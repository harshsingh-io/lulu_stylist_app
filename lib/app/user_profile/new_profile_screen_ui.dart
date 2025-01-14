import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lulu_stylist_app/logic/api/users/models/update_profile_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/bloc/user_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/services/here_api_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _refreshUserData() async {
    context.read<UserBloc>().add(const UserEvent.fetchUserData());
  }

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.fetchUserData());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshUserData,
      color: LuluBrandColor.brandPrimary,
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (message) {
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
              } else {
                // Show error message for other failures
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
            },
            profilePictureUploaded: (photoUrl) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile picture updated successfully'),
                  backgroundColor: LuluBrandColor.brandPrimary,
                ),
              );
              // Update profile picture in UI
              setState(() {
                context.read<UserBloc>().add(const UserEvent.fetchUserData());
              });
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: LuluBrandColor.brandPrimary,
              ),
            ),
            loaded: (userData) => _ProfilePageContent(userData: userData),
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48.sp,
                    color: LuluBrandColor.brandRed,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    message,
                    style: TextStyle(fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context
                        .read<UserBloc>()
                        .add(const UserEvent.fetchUserData()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LuluBrandColor.brandPrimary,
                    ),
                    child: Text(
                      'Retry',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(
                color: LuluBrandColor.brandPrimary,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProfilePageContent extends StatefulWidget {
  final UserModel userData;

  const _ProfilePageContent({required this.userData});

  @override
  _ProfilePageContentState createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<_ProfilePageContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool notificationsEnabled = false;
  bool dataSharing = true;
  String? profileImageUrl;
  bool isLoadingImage = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    if (widget.userData.userPreferences != null) {
      notificationsEnabled =
          widget.userData.userPreferences!.receiveNotifications;
      dataSharing = widget.userData.userPreferences!.allowDataSharing;
    }
    profileImageUrl = widget.userData.profileImageUrl;
  }

  @override
  void didUpdateWidget(covariant _ProfilePageContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userData.profileImageUrl != widget.userData.profileImageUrl) {
      setState(() {
        profileImageUrl = widget.userData.profileImageUrl;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = widget.userData;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Header Section
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  LuluBrandColor.brandSecondary,
                  LuluBrandColor.expertDashBoardGreen,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              children: [
                // App Bar
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: LuluBrandColor.brandWhite,
                                fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // Profile Image (Negative margin for overlap)
                Transform.translate(
                  offset: Offset(0, 40.h),
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3.w,
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: _showProfilePictureOptions,
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundColor: Colors.grey,
                            backgroundImage: profileImageUrl != null
                                ? NetworkImage(profileImageUrl!)
                                : null,
                            child: isLoadingImage
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : (profileImageUrl == null
                                    ? Icon(Icons.person,
                                        size: 40.sp, color: Colors.white)
                                    : null),
                          ),
                        ),
                        Positioned(
                          right: -4.w,
                          bottom: -4.h,
                          child: Container(
                            padding: EdgeInsets.all(4.r),
                            decoration: const BoxDecoration(
                              color: Color(0xFF3F7A4E),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Profile Info and Tabs
          Container(
            padding: EdgeInsets.only(top: 48.h),
            child: Column(
              children: [
                Text(
                  userData.userDetails?.name ?? 'No Name',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4.h),
                FutureBuilder<String>(
                  future: _getLocationName(
                    userData.userDetails?.locationLat,
                    userData.userDetails?.locationLong,
                  ),
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          snapshot.data ?? 'Loading location...',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 16.h),
                TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFF3F7A4E),
                  indicatorColor: Color(0xFF3F7A4E),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Details', height: 40.h),
                    Tab(text: 'Style', height: 40.h),
                    Tab(text: 'Preferences', height: 40.h),
                  ],
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildDetailsTab(),
                _buildStyleTab(),
                _buildPreferencesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _getLocationName(String? lat, String? lng) async {
    if (lat == null || lng == null) return 'Location not set';
    try {
      final double latitude = double.parse(lat);
      final double longitude = double.parse(lng);
      return await HereApiService.getLocationName(latitude, longitude);
    } catch (e) {
      return 'Invalid location';
    }
  }

  Widget _buildDetailsTab() {
    final userDetails = widget.userData.userDetails;
    if (userDetails == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          _buildCard(
            'Personal Information',
            Icons.person,
            Column(
              children: [
                _buildInfoRow('Age', userDetails.age.toString(), Icons.cake),
                SizedBox(height: 16.h),
                if (userDetails.gender != null)
                  _buildInfoRow('Gender', userDetails.gender!, Icons.wc),
              ],
            ),
            onEdit: () => _showPersonalInfoDialog(widget.userData),
          ),
          SizedBox(height: 16.h),
          if (userDetails.bodyMeasurements != null)
            _buildCard(
              'Body Measurements',
              Icons.straighten,
              onEdit: () => _showBodyMeasurementsDialog(widget.userData),
              Column(
                children: [
                  _buildInfoRow(
                      'Height',
                      '${userDetails.bodyMeasurements!.height.round()} cm',
                      Icons.height),
                  SizedBox(height: 16.h),
                  _buildInfoRow(
                      'Weight',
                      '${userDetails.bodyMeasurements!.weight.round()} kg',
                      Icons.monitor_weight),
                  if (userDetails.bodyMeasurements!.bodyType != null) ...[
                    SizedBox(height: 16.h),
                    _buildInfoRow(
                        'Body Type',
                        userDetails.bodyMeasurements!.bodyType!,
                        Icons.accessibility_new),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStyleTab() {
    final stylePrefs = widget.userData.userDetails?.stylePreferences;
    if (stylePrefs == null) {
      return const Center(child: Text('No style preferences set'));
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: _buildCard(
        'Style Preferences',
        Icons.shopping_bag,
        onEdit: () => _showStylePreferencesDialog(widget.userData),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChipSection(
                'Favorite Colors', stylePrefs.favoriteColors, Icons.palette),
            SizedBox(height: 16.h),
            _buildChipSection('Preferred Brands', stylePrefs.preferredBrands,
                Icons.branding_watermark),
            SizedBox(height: 16.h),
            _buildChipSection(
                'Lifestyle', stylePrefs.lifestyleChoices, Icons.local_activity),
            SizedBox(height: 16.h),
            _buildInfoRow(
                'Budget Range',
                '${stylePrefs.budget.minAmount.round()} - ${stylePrefs.budget.maxAmount.round()}',
                Icons.attach_money),
            SizedBox(height: 16.h),
            _buildInfoRow('Shopping Frequency',
                stylePrefs.shoppingHabits.frequency, Icons.schedule),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferencesTab() {
    final prefs = widget.userData.userPreferences;
    if (prefs == null) {
      return const Center(child: Text('No preferences set'));
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: _buildCard(
        'User Preferences',
        Icons.security,
        onEdit: () => _showPreferencesDialog(widget.userData),
        Column(
          children: [
            _buildSwitchRow(
              'Notifications',
              'Receive push notifications',
              prefs.receiveNotifications,
              (value) {
                updateUserProfile(receiveNotifications: value);
              },
            ),
            SizedBox(height: 16.h),
            _buildSwitchRow(
              'Data Sharing',
              'Allow data sharing',
              prefs.allowDataSharing,
              (value) {
                updateUserProfile(allowDataSharing: value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Widget content,
      {Function()? onEdit}) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 20.sp, color: const Color(0xFF3F7A4E)),
                    SizedBox(width: 8.w),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 20.sp),
                  onPressed: onEdit,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, [IconData? icon]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16.sp,
                color: Colors.grey,
              ),
              SizedBox(width: 8.w),
            ],
            Text(
              label,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildChipSection(String title, List<String> items, [IconData? icon]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16.sp, color: Colors.grey),
              SizedBox(width: 8.w),
            ],
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: items.map((item) => _buildCustomChip(item)).toList(),
        ),
      ],
    );
  }

  Widget _buildCustomChip(String label) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            LuluBrandColor.brandSecondary,
            LuluBrandColor.expertDashBoardGreen,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: () {}, // Add your tap handler here
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF059669),
        ),
      ],
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 20.sp,
                    color: const Color(0xFF059669),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20.sp,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...children,
        ],
      ),
    );
  }

  void _showPersonalInfoDialog(UserModel userData) {
    int tempAge = userData.userDetails?.age ?? 18;
    String tempGender = userData.userDetails?.gender ?? 'Male';
    String tempLocation = userData.userDetails?.locationLat ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Personal Information'),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Age: $tempAge'),
                Slider(
                  value: tempAge.toDouble(),
                  min: 15,
                  max: 100,
                  divisions: 85,
                  onChanged: (value) {
                    setState(() => tempAge = value.toInt());
                  },
                ),
                DropdownButtonFormField<String>(
                  value: tempGender,
                  onChanged: (value) {
                    setState(() => tempGender = value!);
                  },
                  items: ['Male', 'Female', 'Other']
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                ),
                TextFormField(
                  initialValue: tempLocation,
                  onChanged: (value) => tempLocation = value,
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              updateUserProfile(
                age: tempAge,
                gender: tempGender,
                location: tempLocation,
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showBodyMeasurementsDialog(UserModel userData) {
    double tempHeight =
        (userData.userDetails?.bodyMeasurements?.height ?? 170).roundToDouble();
    double tempWeight =
        (userData.userDetails?.bodyMeasurements?.weight ?? 70).roundToDouble();
    String tempBodyType =
        userData.userDetails?.bodyMeasurements?.bodyType ?? 'ECTOMORPH';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Body Measurements'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Height: ${tempHeight.round()} cm'),
                Slider(
                  value: tempHeight,
                  min: 100,
                  max: 220,
                  divisions: 120,
                  onChanged: (value) {
                    setState(() => tempHeight = value.roundToDouble());
                  },
                ),
                Text('Weight: ${tempWeight.round()} kg'),
                Slider(
                  value: tempWeight,
                  min: 30,
                  max: 150,
                  divisions: 120,
                  onChanged: (value) {
                    setState(() => tempWeight = value.roundToDouble());
                  },
                ),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'ECTOMORPH', label: Text('Ectomorph')),
                    ButtonSegment(value: 'MESOMORPH', label: Text('Mesomorph')),
                    ButtonSegment(value: 'ENDOMORPH', label: Text('Endomorph')),
                  ],
                  selected: {tempBodyType},
                  onSelectionChanged: (Set<String> selection) {
                    setState(() => tempBodyType = selection.first);
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              updateUserProfile(
                height: tempHeight.roundToDouble(),
                weight: tempWeight.roundToDouble(),
                bodyType: tempBodyType,
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showStylePreferencesDialog(UserModel userData) {
    final prefs = userData.userDetails?.stylePreferences;
    List<String> tempColors = List.from(prefs?.favoriteColors ?? []);
    List<String> tempBrands = List.from(prefs?.preferredBrands ?? []);
    List<String> tempLifestyle = List.from(prefs?.lifestyleChoices ?? []);
    int tempMinBudget = (prefs?.budget.minAmount ?? 100).round();
    int tempMaxBudget = (prefs?.budget.maxAmount ?? 1000).round();
    String tempFreq = prefs?.shoppingHabits.frequency ?? 'Monthly';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Style Preferences'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChipInputField(
                    initialValue: tempColors,
                    label: 'Favorite Colors',
                    suggestions: ['Red', 'Blue', 'Black', 'White'],
                    onChanged: (colors) {
                      setState(() => tempColors = colors);
                    },
                  ),
                  ChipInputField(
                    initialValue: tempBrands,
                    label: 'Preferred Brands',
                    suggestions: ['Nike', 'Adidas', 'Puma'],
                    onChanged: (brands) {
                      setState(() => tempBrands = brands);
                    },
                  ),
                  Text(
                    'Budget Range',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: tempMinBudget.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Min Budget',
                            prefixText: '\$',
                          ),
                          onChanged: (value) {
                            setState(() {
                              tempMinBudget =
                                  int.tryParse(value) ?? tempMinBudget;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: TextFormField(
                          initialValue: tempMaxBudget.toString(),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Max Budget',
                            prefixText: '\$',
                          ),
                          onChanged: (value) {
                            setState(() {
                              tempMaxBudget =
                                  int.tryParse(value) ?? tempMaxBudget;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildInfoRow(
                    'Shopping Frequency',
                    tempFreq,
                    Icons.schedule,
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              updateUserProfile(
                favoriteColors: tempColors,
                preferredBrands: tempBrands,
                lifestyleChoices: tempLifestyle,
                minBudget: tempMinBudget.toDouble(),
                maxBudget: tempMaxBudget.toDouble(),
                shoppingFrequency: tempFreq,
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showPreferencesDialog(UserModel userData) {
    bool tempNotifs = userData.userPreferences?.receiveNotifications ?? false;
    bool tempSharing = userData.userPreferences?.allowDataSharing ?? false;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit User Preferences'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchListTile(
                  value: tempNotifs,
                  onChanged: (value) {
                    setState(() => tempNotifs = value);
                  },
                  title: const Text('Notifications'),
                ),
                SwitchListTile(
                  value: tempSharing,
                  onChanged: (value) {
                    setState(() => tempSharing = value);
                  },
                  title: const Text('Data Sharing'),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              updateUserProfile(
                receiveNotifications: tempNotifs,
                allowDataSharing: tempSharing,
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

// Update the _buildCard method to use these dialogs

  void updateUserProfile({
    String? name,
    int? age,
    String? gender,
    String? location,
    double? height,
    double? weight,
    String? bodyType,
    List<String>? favoriteColors,
    List<String>? preferredBrands,
    List<String>? lifestyleChoices,
    double? minBudget,
    double? maxBudget,
    String? shoppingFrequency,
    List<String>? preferredRetailers,
    bool? receiveNotifications,
    bool? allowDataSharing,
  }) {
    final userData = widget.userData;

    // Create update request maintaining existing data
    final updateRequest = UpdateProfileRequestModel(
      userDetails: UserDetailsRequest(
        // Personal Info: Use new value if provided, otherwise keep existing
        name: name ?? userData.userDetails?.name ?? '',
        age: age ?? userData.userDetails?.age ?? 18,
        gender: gender ?? userData.userDetails?.gender ?? 'Male',
        locationLat: location ?? userData.userDetails?.locationLat ?? '',
        locationLong: location ?? userData.userDetails?.locationLong ?? '',

        // Body Measurements
        bodyMeasurements: BodyMeasurementsRequest(
          height:
              height ?? userData.userDetails?.bodyMeasurements?.height ?? 170.0,
          weight:
              weight ?? userData.userDetails?.bodyMeasurements?.weight ?? 70.0,
          bodyType: bodyType ??
              userData.userDetails?.bodyMeasurements?.bodyType ??
              '',
        ),

        // Style Preferences
        stylePreferences: StylePreferencesRequest(
          favoriteColors: favoriteColors ??
              userData.userDetails?.stylePreferences?.favoriteColors ??
              [],
          preferredBrands: preferredBrands ??
              userData.userDetails?.stylePreferences?.preferredBrands ??
              [],
          lifestyleChoices: lifestyleChoices ??
              userData.userDetails?.stylePreferences?.lifestyleChoices ??
              [],
          budget: BudgetRequest(
            minAmount: minBudget ??
                userData.userDetails?.stylePreferences?.budget.minAmount ??
                100.0,
            maxAmount: maxBudget ??
                userData.userDetails?.stylePreferences?.budget.maxAmount ??
                1000.0,
          ),
          shoppingHabits: ShoppingHabitsRequest(
            frequency: shoppingFrequency ??
                userData
                    .userDetails?.stylePreferences?.shoppingHabits.frequency ??
                '',
            preferredRetailers: preferredRetailers ??
                userData.userDetails?.stylePreferences?.shoppingHabits
                    .preferredRetailers ??
                [],
          ),
        ),
      ),

      // User Preferences
      userPreferences: UserPreferencesRequest(
        receiveNotifications: receiveNotifications ??
            userData.userPreferences?.receiveNotifications ??
            false,
        allowDataSharing: allowDataSharing ??
            userData.userPreferences?.allowDataSharing ??
            false,
      ),
    );

    // Dispatch update event
    context
        .read<UserBloc>()
        .add(UserEvent.updateProfile(userData: updateRequest));
  }

  Widget _buildAgeInput() {
    return Column(
      children: [
        Slider(
          value: widget.userData.userDetails?.age?.toDouble() ?? 18,
          onChanged: (value) {
            updateUserProfile(age: value.toInt());
          },
        ),
      ],
    );
  }

  // For updating body measurements
  Widget _buildBodyMeasurementsSection() {
    return Row(
      children: [
        TextFormField(
          initialValue:
              widget.userData.userDetails?.bodyMeasurements?.height.toString(),
          onChanged: (value) {
            updateUserProfile(height: double.tryParse(value));
          },
        ),
        TextFormField(
          initialValue:
              widget.userData.userDetails?.bodyMeasurements?.weight.toString(),
          onChanged: (value) {
            updateUserProfile(weight: double.tryParse(value));
          },
        ),
      ],
    );
  }

  // For updating style preferences
  Widget _buildStylePreferencesSection() {
    return Column(
      children: [
        // Favorite Colors
        // ChipInputField(
        //   initialValue:
        //       widget.userData.userDetails?.stylePreferences?.favoriteColors ??
        //           [],
        //   onChanged: (colors) {
        //     updateUserProfile(favoriteColors: colors);
        //   },
        // ),

        // Budget Range
        RangeSlider(
          values: RangeValues(
            widget.userData.userDetails?.stylePreferences?.budget.minAmount ??
                100,
            widget.userData.userDetails?.stylePreferences?.budget.maxAmount ??
                1000,
          ),
          onChanged: (values) {
            updateUserProfile(
              minBudget: values.start,
              maxBudget: values.end,
            );
          },
        ),
      ],
    );
  }

  // For updating user preferences
  Widget _buildPreferencesSection() {
    return Column(
      children: [
        SwitchListTile(
          value: widget.userData.userPreferences?.receiveNotifications ?? false,
          onChanged: (value) {
            updateUserProfile(receiveNotifications: value);
          },
          title: const Text('Receive Notifications'),
          subtitle:
              const Text('Get updates about new styles and recommendations'),
        ),
        SwitchListTile(
          value: widget.userData.userPreferences?.allowDataSharing ?? false,
          onChanged: (value) {
            updateUserProfile(allowDataSharing: value);
          },
          title: const Text('Allow Data Sharing'),
          subtitle: const Text(
              'Share data for personalized recommendations including:\n'
              '• Style preferences\n'
              '• Shopping patterns\n'
              '• Wardrobe analysis\n'
              '• Size recommendations'),
        ),
      ],
    );
  }

  void _showProfilePictureOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.visibility,
                    color: LuluBrandColor.brandPrimary),
                title: const Text('View Profile Picture'),
                onTap: () {
                  Navigator.pop(context);
                  _showProfilePicture();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt,
                    color: LuluBrandColor.brandPrimary),
                title: const Text('Upload Profile Picture'),
                onTap: () {
                  Navigator.pop(context);
                  _showImageSourceOptions();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showProfilePicture() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 300.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  image: widget.userData.profileImageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(widget.userData.profileImageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: widget.userData.profileImageUrl == null
                    ? Icon(Icons.person, size: 150.sp, color: Colors.grey)
                    : null,
              ),
              Positioned(
                top: -10.h,
                right: -10.w,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: LuluBrandColor.brandPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showImageSourceOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera,
                    color: LuluBrandColor.brandPrimary),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library,
                    color: LuluBrandColor.brandPrimary),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if (image != null) {
        if (!mounted) return;
        _showImagePreview(image, source);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  void _showImagePreview(XFile image, ImageSource source) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 300.w,
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r)),
                    image: DecorationImage(
                      image: FileImage(File(image.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Wrap(
                    spacing: 8.w,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 85.w,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            _pickImage(source);
                          },
                          icon: Icon(
                            source == ImageSource.camera
                                ? Icons.camera_alt
                                : Icons.photo_library,
                            color: LuluBrandColor.brandPrimary,
                            size: 16.sp,
                          ),
                          label: Text(
                            source == ImageSource.camera ? 'Retake' : 'Choose',
                            style: TextStyle(
                              color: LuluBrandColor.brandPrimary,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 85.w,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<UserBloc>().add(
                                  UserEvent.uploadDisplayPicture(
                                    displayPicture: File(image.path),
                                  ),
                                );
                          },
                          icon: Icon(
                            Icons.check,
                            color: LuluBrandColor.brandPrimary,
                            size: 16.sp,
                          ),
                          label: Text(
                            'Upload',
                            style: TextStyle(
                              color: LuluBrandColor.brandPrimary,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 85.w,
                        child: TextButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 16.sp,
                          ),
                          label: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChipInputField extends StatefulWidget {
  final List<String> initialValue;
  final Function(List<String>) onChanged;
  final String label;
  final String? helperText;
  final List<String>? suggestions;

  const ChipInputField({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    required this.label,
    this.helperText,
    this.suggestions,
  }) : super(key: key);

  @override
  State<ChipInputField> createState() => _ChipInputFieldState();
}

class _ChipInputFieldState extends State<ChipInputField> {
  late List<String> _values;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _values = List.from(widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        if (widget.helperText != null)
          Text(
            widget.helperText!,
            style: TextStyle(color: Colors.grey, fontSize: 12.sp),
          ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            ..._values.map((value) => Chip(
                  label: Text(value),
                  onDeleted: () {
                    setState(() {
                      _values.remove(value);
                      widget.onChanged(_values);
                    });
                  },
                )),
            if (widget.suggestions != null)
              ...widget.suggestions!
                  .where((suggestion) => !_values.contains(suggestion))
                  .map((suggestion) => ActionChip(
                        label: Text(suggestion),
                        onPressed: () {
                          setState(() {
                            _values.add(suggestion);
                            widget.onChanged(_values);
                          });
                        },
                      )),
          ],
        ),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Type and press Enter to add',
            suffixIcon: IconButton(
              icon: const Icon(Icons.add),
              onPressed: _addValue,
            ),
          ),
          onSubmitted: (_) => _addValue(),
        ),
      ],
    );
  }

  void _addValue() {
    if (_controller.text.isNotEmpty && !_values.contains(_controller.text)) {
      setState(() {
        _values.add(_controller.text);
        widget.onChanged(_values);
        _controller.clear();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
