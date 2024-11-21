import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/update_profile/profile_update_success.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_typography.dart';
import 'package:lulu_stylist_app/routes/routes.dart';
import 'package:nanoid/nanoid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path; // Import for 'path' package

class UserUpdateForm extends StatefulWidget {
  @override
  _UserUpdateFormState createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Form Fields
  String userName = '';
  int userAge = 18;
  String userGender = 'Male';
  String userLocation = '';
  double heightCm = 170.0;
  double weight = 70.0;
  String bodyType = '';
  List<String> favoriteColors = [];
  List<String> preferredBrands = [];
  List<String> lifestyleChoices = [];
  double minBudget = 100.0;
  double maxBudget = 1000.0;
  String shoppingFrequency = '';
  List<String> preferredRetailers = [];
  bool receiveNotifications = false;
  bool allowDataSharing = false;

  // New Field for Profile Image
  String? profileImagePath;

  // Validation Errors
  String? _nameError;
  String? _budgetError;

  Logger log = Logger(printer: PrettyPrinter());

  // Animation Duration
  final Duration _animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _checkExistingUserData();
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
        title: Text('Personal Information'),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        content: _buildPersonalInfoStep(),
      ),
      Step(
        title: Text('Body Measurements'),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        content: _buildBodyMeasurementsStep(),
      ),
      Step(
        title: Text('Style Preferences'),
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        content: _buildStylePreferencesStep(),
      ),
      Step(
        title: Text('Budget & Habits'),
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        content: _buildBudgetHabitsStep(),
      ),
      Step(
        title: Text('Preferences'),
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
      labelStyle: TextStyle(
          color: LuluBrandColor.brandPrimary), // Replace with your color
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: LuluBrandColor.brandPrimary), // Replace with your color
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  // Check for existing user data
  Future<void> _checkExistingUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('userDetails');

    if (userDataJson != null && userDataJson.isNotEmpty) {
      log.i("Existing user data found. Navigating to home screen.");
      // Navigate to home screen
      // Replace '/home' with your actual home route
      GoRouter.of(context).pushReplacementNamed(homeRoute);
    } else {
      log.i("No existing user data. Showing profile update form.");
      // No action needed, stay on the form
    }
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
          Text(
            'Personal Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          // Profile Picture Upload
          _buildProfilePictureUpload(),
          SizedBox(height: 16),
          _buildNameInput(),
          SizedBox(height: 16),
          _buildAgeInput(),
          SizedBox(height: 16),
          _buildGenderDropdown(),
          SizedBox(height: 16),
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
        Text(
          'Profile Picture',
          style: TextStyle(
              color: LuluBrandColor.brandPrimary), // Replace with your color
        ),
        SizedBox(height: 8),
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
                  ? Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: _pickProfileImage,
            child: Text(
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
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Get the application documents directory
        final Directory appDir = await getApplicationDocumentsDirectory();
        final String fileName = path.basename(image.path);
        final File savedImage =
            await File(image.path).copy('${appDir.path}/$fileName');

        setState(() {
          profileImagePath = savedImage.path;
        });
      }
    } catch (e) {
      log.e("Error picking image: $e");
      // Optionally, show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image. Please try again.')),
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
        Text('Age',
            style: TextStyle(
                color: LuluBrandColor.brandPrimary)), // Replace with your color
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
          style: TextStyle(color: Colors.grey),
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
          .map((gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ))
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
          Text(
            'Body Measurements',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildHeightInput(),
          SizedBox(height: 16),
          _buildWeightInput(),
          SizedBox(height: 16),
          _buildBodyTypeInput(),
        ],
      ),
    );
  }

  Widget _buildHeightInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Height (cm)',
            style: TextStyle(
                color: LuluBrandColor.brandPrimary)), // Replace with your color
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
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildWeightInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weight (kg)',
            style: TextStyle(
                color: LuluBrandColor.brandPrimary)), // Replace with your color
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
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildBodyTypeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          'Body Type',
          style: TextStyle(
            color: LuluBrandColor.brandPrimary,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: _showBodyTypeInfoDialog,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bodyType.isEmpty ? 'Select Body Type' : bodyType,
                          style: TextStyle(fontSize: 16)),
                      Icon(Icons.arrow_drop_down,
                          color: LuluBrandColor.brandPrimary),
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Your Body Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/images/image.png'),
              Text(
                  'Choose the correct body type based on the descriptions provided.'),
              SizedBox(height: 16),
              Container(
                height: 2,
                color: LuluBrandColor.brandGrey300,
              ),
              ListTile(
                title: Text(
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
                title: Text(
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
                title: Text(
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
          SizedBox(height: 16),
          _buildFavoriteColorsInput(),
          SizedBox(height: 16),
          _buildPreferredBrandsInput(),
          SizedBox(height: 16),
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
            suffixIcon:
                Icon(Icons.arrow_drop_down, color: LuluBrandColor.brandPrimary),
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
          SizedBox(height: 16),
          _buildBudgetRange(),
          SizedBox(height: 16),
          _buildShoppingFrequencyInput(),
          SizedBox(height: 16),
          _buildPreferredRetailersInput(),
        ],
      ),
    );
  }

  Widget _buildBudgetRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Budget (in dollars)',
            style: TextStyle(
                color: LuluBrandColor.brandPrimary)), // Replace with your color
        RangeSlider(
          values: RangeValues(minBudget, maxBudget),
          min: 0,
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
          style: TextStyle(color: Colors.grey),
        ),
        if (_budgetError != null)
          Text(
            _budgetError!,
            style: TextStyle(color: Colors.red),
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
          SizedBox(height: 16),
          _buildReceiveNotificationsSwitch(),
          SizedBox(height: 16),
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
      title: Text('Receive Notifications',
          style: TextStyle(
              color: LuluBrandColor.brandPrimary)), // Replace with your color
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
      title: Text('Allow Data Sharing',
          style: TextStyle(
              color: LuluBrandColor.brandPrimary)), // Replace with your color
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
        List<String> brands = [
          'Nike',
          'Adidas',
          'Levi\'s',
          'Gap',
          'Old Navy',
          'Polo Ralph Lauren'
        ];
        return AlertDialog(
          backgroundColor: LuluBrandColor.brandWhite,
          title: Text('Select Preferred Brands'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: brands
                      .map((brand) => CheckboxListTile(
                            title: Text(brand),
                            value: preferredBrands.contains(brand),
                            onChanged: (bool? selected) {
                              setDialogState(() {
                                if (selected == true &&
                                    !preferredBrands.contains(brand)) {
                                  preferredBrands.add(brand);
                                  log.d("Added brand: $brand");
                                } else {
                                  preferredBrands.remove(brand);
                                  log.d("Removed brand: $brand");
                                }
                              });
                            },
                          ))
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
              child: Text(
                'Close',
                style: TextStyle(color: LuluBrandColor.brandRed),
              ),
            ),
          ],
        );
      },
    );
  }

  // Submit Form
  void _submitForm() {
    // Additional validations if needed
    if (_nameError != null || _budgetError != null) {
      // Show a snackbar or dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fix the errors before submitting')),
      );
      return;
    }

    // Save the form data
    _saveFormData();

    // Navigate to success screen
    GoRouter.of(context)
        .pushReplacementNamed(profileUpdateSuccess); // Replace with your route
  }

  // Save Form Data
  Future<void> _saveFormData() async {
    log.i("Saving form data...");
    final prefs = await SharedPreferences.getInstance();

    final userUpdateRequest = UserUpdateRequestModel(
      userId: 'unique_user_id', // Replace with actual user ID
      userDetails: UserDetails(
        name: userName,
        age: userAge,
        gender: userGender,
        locationLat: userLocation,
        locationLong: userLocation,
        bodyMeasurements: BodyMeasurements(
          height: heightCm,
          weight: weight,
          bodyType: bodyType,
        ),
        stylePreferences: StylePreferences(
          favoriteColors: favoriteColors,
          preferredBrands: preferredBrands,
          lifestyleChoices: lifestyleChoices,
          budget: Budget(min: minBudget, max: maxBudget),
          shoppingHabits: ShoppingHabits(
            frequency: shoppingFrequency,
            preferredRetailers: preferredRetailers,
          ),
        ),
      ),
      wardrobeItems: [], // Populate based on your logic
      preferences: UserPreferences(
        receiveNotifications: receiveNotifications,
        allowDataSharing: allowDataSharing,
      ),
      profileImagePath: profileImagePath, // New Field
    );

    String userDataJson = json.encode(userUpdateRequest.toJson());
    log.d("User data JSON: $userDataJson");

    await prefs.setString('userDetails', userDataJson);
    log.i("User data saved successfully.");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Profile',
            style: TextStyle(
              color: Colors.white, // Replace with your color
            ),
          ),
          backgroundColor:
              LuluBrandColor.brandPrimary, // Replace with your color
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stepper(
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepContinue: _nextStep,
            onStepCancel: _previousStep,
            connectorColor:
                MaterialStateProperty.all(LuluBrandColor.brandPrimary),
            steps: _steps(),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LuluBrandColor
                            .brandPrimary, // Replace with your color
                      ),
                      onPressed: details.onStepContinue,
                      child: Text(
                          _currentStep == _steps().length - 1
                              ? 'Submit'
                              : 'Next',
                          style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 8),
                    if (_currentStep > 0)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.grey, // Replace with your color
                        ),
                        onPressed: details.onStepCancel,
                        child: Text(
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
      ),
    );
  }
}
