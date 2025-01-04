import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/core/services/secure_storage_service.dart';
import 'package:lulu_stylist_app/logic/api/users/models/update_profile_request_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/bloc/user_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/user/user_repository.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/routes/routes.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserUpdateForm extends StatefulWidget {
  const UserUpdateForm({super.key});

  @override
  _UserUpdateFormState createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  final Logger log = Logger(printer: PrettyPrinter());

  // Form Fields
  String userName = '';
  int userAge = 18;
  String userGender = 'Male';
  String userLocation = '';
  double heightCm = 170;
  double weight = 70;
  String bodyType = '';
  List<String> favoriteColors = [];
  List<String> preferredBrands = [];
  List<String> lifestyleChoices = [];
  double minBudget = 100;
  double maxBudget = 1000;
  String shoppingFrequency = '';
  List<String> preferredRetailers = [];
  bool receiveNotifications = false;
  bool allowDataSharing = false;
  String? profileImagePath;

  // Validation Errors
  String? _nameError;
  String? _budgetError;

  // Animation Duration
  final Duration _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    // Get the current user data from UserBloc
    final userState = context.read<UserBloc>().state;

    userState.maybeWhen(
      success: (userData) {
        _populateFormWithUserData(userData);
      },
      loaded: (userData) {
        _populateFormWithUserData(userData);
      },
      orElse: () {
        // If no user data is available, fetch it
        context.read<UserBloc>().add(const UserEvent.fetchUserData());
      },
    );
  }

  void _populateFormWithUserData(UserModel userData) {
    if (userData != null && mounted) {
      setState(() {
        // Autofill personal information
        userName = userData.userDetails?.name ?? '';
        userAge = userData.userDetails?.age ?? 18;
        userGender = userData.userDetails?.gender ?? 'Male';
        userLocation = userData.userDetails?.locationLat?.toString() ?? '';

        // Autofill body measurements
        heightCm = userData.userDetails?.bodyMeasurements?.height ?? 170;
        weight = userData.userDetails?.bodyMeasurements?.weight ?? 70;
        bodyType = userData.userDetails?.bodyMeasurements?.bodyType ?? '';

        // Autofill style preferences
        favoriteColors =
            userData.userDetails?.stylePreferences?.favoriteColors ?? [];
        preferredBrands =
            userData.userDetails?.stylePreferences?.preferredBrands ?? [];
        lifestyleChoices =
            userData.userDetails?.stylePreferences?.lifestyleChoices ?? [];

        // Autofill budget
        minBudget =
            userData.userDetails?.stylePreferences?.budget?.minAmount ?? 100;
        maxBudget =
            userData.userDetails?.stylePreferences?.budget?.maxAmount ?? 1000;

        // Autofill shopping habits
        shoppingFrequency =
            userData.userDetails?.stylePreferences?.shoppingHabits?.frequency ??
                '';
        preferredRetailers = userData.userDetails?.stylePreferences
                ?.shoppingHabits?.preferredRetailers ??
            [];

        // Autofill preferences
        receiveNotifications =
            userData.userPreferences?.receiveNotifications ?? false;
        allowDataSharing = userData.userPreferences?.allowDataSharing ?? false;
      });
    }
  }

  // Stepper Controls
  void _nextStep() {
    if (_currentStep < _steps().length - 1) {
      setState(() => _currentStep += 1);
    } else {
      _submitForm();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    }
  }

  // Define Steps
  List<Step> _steps() {
    return [
      Step(
        title: const Text('Personal Information'),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        content: _buildPersonalInfoStep(),
      ),
      Step(
        title: const Text('Body Measurements'),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        content: _buildBodyMeasurementsStep(),
      ),
      Step(
        title: const Text('Style Preferences'),
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        content: _buildStylePreferencesStep(),
      ),
      Step(
        title: const Text('Budget & Habits'),
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        content: _buildBudgetHabitsStep(),
      ),
      Step(
        title: const Text('Preferences'),
        isActive: _currentStep >= 4,
        state: _currentStep > 4 ? StepState.complete : StepState.indexed,
        content: _buildPreferencesStep(),
      ),
    ];
  }

  // Reusable Input Decoration
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: LuluBrandColor.brandPrimary,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: LuluBrandColor.brandPrimary,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_nameError != null || _budgetError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fix the errors before submitting'),
        ),
      );
      return;
    }

    // Get the current authentication state
    final authState = context.read<AuthenticationBloc>().state;

    final token = authState.maybeWhen(
      userNeedsProfileDetails: (user, token) => token,
      userLoggedIn: (user, token) => token,
      userAuthenticated: (user, token) => token,
      orElse: () => null,
    );

    if (token == null || token.isEmpty) {
      // Try to get token from secure storage
      final secureStorage = SecureStorageService();
      final storedToken = await secureStorage.getAuthToken();

      if (storedToken == null || storedToken.isEmpty) {
        log.e('Token is null or empty. Auth state: $authState');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please login again')),
        );
        return;
      }
    }

    final userUpdateRequest = UpdateProfileRequestModel(
      userDetails: UserDetailsRequest(
        name: userName,
        age: userAge,
        gender: userGender,
        locationLat: userLocation,
        locationLong: userLocation,
        bodyMeasurements: BodyMeasurementsRequest(
          height: heightCm,
          weight: weight,
          bodyType: bodyType,
        ),
        stylePreferences: StylePreferencesRequest(
          favoriteColors: favoriteColors,
          preferredBrands: preferredBrands,
          lifestyleChoices: lifestyleChoices,
          budget: BudgetRequest(
            minAmount: minBudget,
            maxAmount: maxBudget,
          ),
          shoppingHabits: ShoppingHabitsRequest(
            frequency: shoppingFrequency,
            preferredRetailers: preferredRetailers,
          ),
        ),
      ),
      userPreferences: UserPreferencesRequest(
        receiveNotifications: receiveNotifications,
        allowDataSharing: allowDataSharing,
      ),
    );

    context
        .read<UserBloc>()
        .add(UserEvent.updateProfile(userData: userUpdateRequest));
  }

  Widget _buildFormWithBlocListener() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (user) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile updated successfully')),
              );
              GoRouter.of(context).pushReplacementNamed(profileUpdateSuccess);
            }
          },
          failure: (message) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $message')),
              );
            }
          },
          loading: () {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Loading...')),
              );
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: LuluBrandColor.brandPrimary,
              ),
            ),
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $message'),
                  ElevatedButton(
                    onPressed: () => context.read<UserBloc>().add(
                          const UserEvent.fetchUserData(),
                        ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            orElse: () => Padding(
              padding: const EdgeInsets.all(16),
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: _nextStep,
                onStepCancel: _previousStep,
                connectorColor:
                    const MaterialStatePropertyAll(LuluBrandColor.brandPrimary),
                steps: _steps(),
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LuluBrandColor.brandPrimary,
                          ),
                          onPressed: details.onStepContinue,
                          child: Text(
                            _currentStep == _steps().length - 1
                                ? 'Submit'
                                : 'Next',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (_currentStep > 0)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            onPressed: details.onStepCancel,
                            child: const Text(
                              'Back',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Personal Information Step
  Widget _buildPersonalInfoStep() {
    return AnimatedSwitcher(
      duration: _animationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Fade Transition
        return FadeTransition(opacity: animation, child: child);
      },
      child: Column(
        key: ValueKey<int>(_currentStep), // Unique key for animation
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Profile Picture Upload
          // _buildProfilePictureUpload(),
          // const SizedBox(height: 16),
          _buildNameInput(),
          const SizedBox(height: 16),
          _buildAgeInput(),
          const SizedBox(height: 16),
          _buildGenderDropdown(),
          const SizedBox(height: 16),
          _buildLocationInput(),
        ],
      ),
    );
  }

  // Widget to Upload Profile Picture
  Widget _buildProfilePictureUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profile Picture',
          style: TextStyle(
            color: LuluBrandColor.brandPrimary,
          ), // Replace with your color
        ),
        const SizedBox(height: 8),
        Center(
          child: GestureDetector(
            onTap: _pickProfileImage,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage: profileImagePath != null
                  ? FileImage(File(profileImagePath!))
                  : null,
              child: profileImagePath == null
                  ? const Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: _pickProfileImage,
            child: const Text(
              'Upload Image',
              style: TextStyle(color: LuluBrandColor.brandPrimary25),
            ),
          ),
        ),
      ],
    );
  }

  // Function to Pick Profile Image
  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Get the application documents directory
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = path.basename(image.path);
        final savedImage =
            await File(image.path).copy('${appDir.path}/$fileName');

        setState(() {
          profileImagePath = savedImage.path;
        });
      }
    } catch (e) {
      log.e('Error picking image: $e');
      // Optionally, show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to pick image. Please try again.'),
        ),
      );
    }
  }

  Widget _buildNameInput() {
    return TextFormField(
      decoration: _inputDecoration('Name').copyWith(
        errorText: _nameError,
      ),
      onChanged: (value) {
        setState(() {
          userName = value;
          if (value.isEmpty) {
            _nameError = 'Please enter your name';
          } else {
            _nameError = null;
          }
        });
      },
      initialValue: userName,
    );
  }

  Widget _buildAgeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Age',
          style: TextStyle(
            color: LuluBrandColor.brandPrimary,
          ),
        ), // Replace with your color
        Slider(
          value: userAge.toDouble(),
          min: 10,
          max: 100,
          divisions: 90,
          label: '$userAge',
          activeColor: LuluBrandColor.brandPrimary,
          onChanged: (double value) {
            setState(() {
              userAge = value.toInt();
            });
          },
        ),
        Text(
          '$userAge years',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: _inputDecoration('Gender'),
      dropdownColor: LuluBrandColor.brandWhite,
      value: userGender,
      items: ['Male', 'Female', 'Other']
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(gender),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          userGender = value!;
        });
      },
    );
  }

  Widget _buildLocationInput() {
    return TextFormField(
      decoration: _inputDecoration('Location'),
      onChanged: (value) {
        setState(() {
          userLocation = value;
        });
      },
      initialValue: userLocation,
    );
  }

  // Body Measurements Step
  Widget _buildBodyMeasurementsStep() {
    return AnimatedSwitcher(
      duration: _animationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Fade Transition
        return FadeTransition(opacity: animation, child: child);
      },
      child: Column(
        key: ValueKey<int>(_currentStep), // Unique key for animation
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Body Measurements',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildHeightInput(),
          const SizedBox(height: 16),
          _buildWeightInput(),
          const SizedBox(height: 16),
          _buildBodyTypeInput(),
        ],
      ),
    );
  }

  Widget _buildHeightInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Height (cm)',
          style: TextStyle(
            color: LuluBrandColor.brandPrimary,
          ),
        ), // Replace with your color
        Slider(
          value: heightCm,
          min: 100,
          max: 250,
          divisions: 150,
          label: '${heightCm.toInt()} cm',
          activeColor: LuluBrandColor.brandPrimary,
          onChanged: (double value) {
            setState(() {
              heightCm = value;
            });
          },
        ),
        Text(
          '${heightCm.toInt()} cm',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildWeightInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weight (kg)',
          style: TextStyle(
            color: LuluBrandColor.brandPrimary,
          ),
        ), // Replace with your color
        Slider(
          value: weight,
          min: 30,
          max: 200,
          divisions: 170,
          label: '${weight.toInt()} kg',
          activeColor: LuluBrandColor.brandPrimary,
          onChanged: (double value) {
            setState(() {
              weight = value;
            });
          },
        ),
        Text(
          '${weight.toInt()} kg',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildBodyTypeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Body Type',
          style: TextStyle(
            color: LuluBrandColor.brandPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: _showBodyTypeInfoDialog,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bodyType.isEmpty ? 'Select Body Type' : bodyType,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: LuluBrandColor.brandPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showBodyTypeInfoDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFAFFFF),
          title: const Text('Select Your Body Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/bodytype.webp'),
              const Text(
                'Choose the correct body type based on the descriptions provided.',
              ),
              const SizedBox(height: 16),
              Container(
                height: 2,
                color: LuluBrandColor.brandGrey300,
              ),
              ListTile(
                title: const Text(
                  'ECTOMORPH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  _selectBodyType('ECTOMORPH');
                },
              ),
              Container(
                height: 1,
                color: LuluBrandColor.brandGrey200,
              ),
              ListTile(
                title: const Text(
                  'MESOMORPH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  _selectBodyType('MESOMORPH');
                },
              ),
              Container(
                height: 1,
                color: LuluBrandColor.brandGrey200,
              ),
              ListTile(
                title: const Text(
                  'ENDOMORPH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  _selectBodyType('ENDOMORPH');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectBodyType(String type) {
    Navigator.of(context).pop(); // Close the dialog
    setState(() {
      bodyType = type;
    });
  }

  // Style Preferences Step
  Widget _buildStylePreferencesStep() {
    return AnimatedSwitcher(
      duration: _animationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Fade Transition
        return FadeTransition(opacity: animation, child: child);
      },
      child: Column(
        key: ValueKey<int>(_currentStep),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Style Preferences',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildFavoriteColorsInput(),
          const SizedBox(height: 16),
          _buildPreferredBrandsInput(),
          const SizedBox(height: 16),
          _buildLifestyleChoicesInput(),
        ],
      ),
    );
  }

  Widget _buildFavoriteColorsInput() {
    return TextFormField(
      decoration: _inputDecoration('Favorite Colors (comma separated)'),
      onChanged: (value) {
        setState(() {
          favoriteColors = value.split(',').map((e) => e.trim()).toList();
        });
      },
      initialValue: favoriteColors.join(', '),
    );
  }

  Widget _buildPreferredBrandsInput() {
    return GestureDetector(
      onTap: _showPreferredBrandsDialog,
      child: AbsorbPointer(
        child: TextFormField(
          decoration: _inputDecoration('Preferred Brands').copyWith(
            suffixIcon: const Icon(
              Icons.arrow_drop_down,
              color: LuluBrandColor.brandPrimary,
            ),
          ),
          controller: TextEditingController(text: preferredBrands.join(', ')),
        ),
      ),
    );
  }

  Widget _buildLifestyleChoicesInput() {
    return TextFormField(
      decoration: _inputDecoration('Lifestyle Choices (comma separated)'),
      onChanged: (value) {
        setState(() {
          lifestyleChoices = value.split(',').map((e) => e.trim()).toList();
        });
      },
      initialValue: lifestyleChoices.join(', '),
    );
  }

  // Budget & Habits Step
  Widget _buildBudgetHabitsStep() {
    return AnimatedSwitcher(
      duration: _animationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Fade Transition
        return FadeTransition(opacity: animation, child: child);
      },
      child: Column(
        key: ValueKey<int>(_currentStep),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Budget & Shopping Habits',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildBudgetRange(),
          const SizedBox(height: 16),
          _buildShoppingFrequencyInput(),
          const SizedBox(height: 16),
          _buildPreferredRetailersInput(),
        ],
      ),
    );
  }

  Widget _buildBudgetRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Budget (in dollars)',
          style: TextStyle(
            color: LuluBrandColor.brandPrimary,
          ),
        ), // Replace with your color
        RangeSlider(
          values: RangeValues(minBudget, maxBudget),
          max: 10000,
          divisions: 100,
          labels:
              RangeLabels('\$${minBudget.toInt()}', '\$${maxBudget.toInt()}'),
          activeColor: LuluBrandColor.brandPrimary,
          onChanged: (RangeValues values) {
            setState(() {
              minBudget = values.start;
              maxBudget = values.end;
              if (minBudget > maxBudget) {
                _budgetError = 'Minimum budget cannot exceed maximum budget';
              } else {
                _budgetError = null;
              }
            });
          },
        ),
        Text(
          'Min: \$${minBudget.toInt()} - Max: \$${maxBudget.toInt()}',
          style: const TextStyle(color: Colors.grey),
        ),
        if (_budgetError != null)
          Text(
            _budgetError!,
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }

  Widget _buildShoppingFrequencyInput() {
    return TextFormField(
      decoration: _inputDecoration('Shopping Frequency'),
      onChanged: (value) {
        setState(() {
          shoppingFrequency = value;
        });
      },
      initialValue: shoppingFrequency,
    );
  }

  Widget _buildPreferredRetailersInput() {
    return TextFormField(
      decoration: _inputDecoration('Preferred Retailers (comma separated)'),
      onChanged: (value) {
        setState(() {
          preferredRetailers = value.split(',').map((e) => e.trim()).toList();
        });
      },
      initialValue: preferredRetailers.join(', '),
    );
  }

  // Preferences Step
  Widget _buildPreferencesStep() {
    return AnimatedSwitcher(
      duration: _animationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Fade Transition
        return FadeTransition(opacity: animation, child: child);
      },
      child: Column(
        key: ValueKey<int>(_currentStep),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Preferences',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildReceiveNotificationsSwitch(),
          const SizedBox(height: 16),
          _buildAllowDataSharingSwitch(),
        ],
      ),
    );
  }

  Widget _buildReceiveNotificationsSwitch() {
    return SwitchListTile(
      activeColor: LuluBrandColor.brandPrimary,
      inactiveTrackColor: LuluBrandColor.brandGrey200,
      inactiveThumbColor: LuluBrandColor.brandPrimary,
      title: const Text(
        'Receive Notifications',
        style: TextStyle(
          color: LuluBrandColor.brandPrimary,
        ),
      ), // Replace with your color
      value: receiveNotifications,
      onChanged: (value) {
        setState(() {
          receiveNotifications = value;
        });
      },
    );
  }

  Widget _buildAllowDataSharingSwitch() {
    return SwitchListTile(
      activeColor: LuluBrandColor.brandPrimary,
      inactiveTrackColor: LuluBrandColor.brandGrey200,
      inactiveThumbColor: LuluBrandColor.brandPrimary,
      title: const Text(
        'Allow Data Sharing',
        style: TextStyle(
          color: LuluBrandColor.brandPrimary,
        ),
      ), // Replace with your color
      value: allowDataSharing,
      onChanged: (value) {
        setState(() {
          allowDataSharing = value;
        });
      },
    );
  }

  // Preferred Brands Dialog
  void _showPreferredBrandsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final brands = <String>[
          'Nike',
          'Adidas',
          "Levi's",
          'Gap',
          'Old Navy',
          'Polo Ralph Lauren',
        ];
        return AlertDialog(
          backgroundColor: LuluBrandColor.brandWhite,
          title: const Text('Select Preferred Brands'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: brands
                      .map(
                        (brand) => CheckboxListTile(
                          title: Text(brand),
                          value: preferredBrands.contains(brand),
                          onChanged: (bool? selected) {
                            setDialogState(() {
                              if (selected == true &&
                                  !preferredBrands.contains(brand)) {
                                preferredBrands.add(brand);
                                log.d('Added brand: $brand');
                              } else {
                                preferredBrands.remove(brand);
                                log.d('Removed brand: $brand');
                              }
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {}); // Refresh the main form
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: LuluBrandColor.brandRed),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepository: UserRepository(baseUrl: apiBase),
        authBloc: context.read<AuthenticationBloc>(),
      )..add(const UserEvent.fetchUserData()), // Fetch data immediately
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update Profile',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: LuluBrandColor.brandPrimary,
          ),
          backgroundColor: Colors.white,
          body: BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (userData) {
                  _populateFormWithUserData(userData);
                },
                loaded: (userData) {
                  _populateFormWithUserData(userData);
                },
                orElse: () {},
              );
            },
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: LuluBrandColor.brandPrimary,
                    ),
                  ),
                  failure: (message) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: $message'),
                        ElevatedButton(
                          onPressed: () => context
                              .read<UserBloc>()
                              .add(const UserEvent.fetchUserData()),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  orElse: () => _buildFormWithBlocListener(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
