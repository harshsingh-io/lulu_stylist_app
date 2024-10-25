import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:lulu_stylist_app/app/update_profile/profile_update_success.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_update_request_model.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_typography.dart';
import 'package:lulu_stylist_app/routes/routes.dart';
import 'package:nanoid/nanoid.dart';
import 'package:shared_preferences/shared_preferences.dart';

Logger log = Logger(printer: PrettyPrinter());

class UserUpdateForm extends StatefulWidget {
  @override
  _UserUpdateFormState createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  String? userName;
  int? userAge;
  String? userGender;
  String? userLocation;
  double? heightCm;
  int? heightFeet;
  int? heightInches;
  double? weight;
  String? bodyType;
  List<String> favoriteColors = [];
  List<String> preferredBrands = [];
  List<String> lifestyleChoices = [];
  double? minBudget;
  double? maxBudget;
  String shoppingFrequency = '';
  List<String> preferredRetailers = [];
  bool receiveNotifications = false;
  bool allowDataSharing = false;

  Future<void> _saveFormData() async {
    log.i("Saving form data...");
    if (userName == null || userName!.isEmpty) {
      log.e("User name is missing.");
      return;
    }
    if (userAge == null || userAge! <= 0) {
      log.e("User age is missing or invalid.");
      return;
    }
    if (userGender == null || userGender!.isEmpty) {
      log.e("User gender is missing.");
      return;
    }
    if (userLocation == null || userLocation!.isEmpty) {
      log.e("User location is missing.");
      return;
    }
    if (heightCm == null || heightCm! <= 0) {
      log.e("Height in cm is missing or invalid.");
      return;
    }
    if (weight == null || weight! <= 0) {
      log.e("Weight is missing or invalid.");
      return;
    }
    if (bodyType == null || bodyType!.isEmpty) {
      log.e("Body type is missing.");
      return;
    }
    if (minBudget == null || maxBudget == null || minBudget! > maxBudget!) {
      log.e(
          "Budget is missing or invalid (minBudget: \$minBudget, maxBudget: \$maxBudget).");
      return;
    }
    if (shoppingFrequency.isEmpty) {
      log.e("Shopping frequency is missing.");
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    // Creating an instance of your model
    final userUpdateRequest = UserUpdateRequestModel(
      userId: nanoid(), // Replace with actual user ID
      userDetails: UserDetails(
        name: userName ?? '',
        age: userAge ?? 0,
        gender: userGender,
        location: userLocation,
        bodyMeasurements: BodyMeasurements(
          height: heightCm ?? 0.0,
          weight: weight ?? 0.0,
          bodyType: bodyType,
        ),
        stylePreferences: StylePreferences(
          favoriteColors: favoriteColors,
          preferredBrands: preferredBrands,
          lifestyleChoices: lifestyleChoices,
          budget: Budget(min: minBudget ?? 0.0, max: maxBudget ?? 0.0),
          shoppingHabits: ShoppingHabits(
            frequency: shoppingFrequency,
            preferredRetailers: preferredRetailers,
          ),
        ),
      ),
      wardrobeItems: [], // Populate this based on your application's logic
      preferences: UserPreferences(
        receiveNotifications: receiveNotifications,
        allowDataSharing: allowDataSharing,
      ),
    );

    // Convert the user data to JSON string
    String userDataJson = json.encode(userUpdateRequest.toJson());
    log.d("User data JSON: \$userDataJson");

    // Save the JSON string in local storage
    await prefs.setString('userDetails', userDataJson);
    log.i("User data saved successfully.");
  }

  void _showPreferredBrandsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Preferred Brands'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: [
                    'Nike',
                    'Adidas',
                    'Levi\'s',
                    'Gap',
                    'Old Navy',
                    'Polo Ralph Lauren'
                  ]
                      .map((brand) => CheckboxListTile(
                            title: Text(brand),
                            value: preferredBrands.contains(brand),
                            onChanged: (bool? selected) {
                              setDialogState(() {
                                if (selected == true &&
                                    !preferredBrands.contains(brand)) {
                                  preferredBrands.add(brand);
                                  log.d("Added brand: \$brand");
                                } else {
                                  preferredBrands.remove(brand);
                                  log.d("Removed brand: \$brand");
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
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Update User Information'),
        //   backgroundColor: LuluBrandColor.brandPrimary,
        // ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Update your profile!',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'to give you better recommendation.',
                          style: TextStyle(
                              fontSize: 16.sp, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Lottie.asset(
                          'assets/lottie/profile_update.json',
                          width: 200.w, // Adjust the size as per your design
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),

                  // User Details
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userName = value;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Age',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userAge = int.tryParse(value!);
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    items: ['Male', 'Female', 'Other']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        userGender = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) {
                      userLocation = value;
                    },
                  ),
                  SizedBox(height: 16),

                  // Body Measurements
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Height (cm)',
                            labelStyle:
                                TextStyle(color: LuluBrandColor.brandPrimary),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: LuluBrandColor.brandPrimary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            heightCm = double.tryParse(value!);
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Height (feet)',
                                labelStyle: TextStyle(
                                    color: LuluBrandColor.brandPrimary),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: LuluBrandColor.brandPrimary),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (value) {
                                heightFeet = int.tryParse(value!);
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Height (inches)',
                                labelStyle: TextStyle(
                                    color: LuluBrandColor.brandPrimary),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: LuluBrandColor.brandPrimary),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (value) {
                                heightInches = int.tryParse(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      weight = double.tryParse(value!);
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Body Type',
                            labelStyle:
                                TextStyle(color: LuluBrandColor.brandPrimary),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: LuluBrandColor.brandPrimary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onSaved: (value) {
                            bodyType = value;
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.info_outline,
                            color: LuluBrandColor.brandPrimary),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Body Type Information'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/images/image.png'),
                                    Text(
                                        'Choose the correct body type based on the descriptions provided.'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close',
                                        style: TextStyle(
                                            color: LuluBrandColor.brandRed)),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Style Preferences
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Favorite Colors (comma separated)',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) {
                      favoriteColors =
                          value?.split(',').map((e) => e.trim()).toList() ?? [];
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    readOnly: true,
                    controller:
                        TextEditingController(text: preferredBrands.join(', ')),
                    decoration: InputDecoration(
                      labelText: 'Preferred Brands',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.arrow_drop_down,
                            color: LuluBrandColor.brandPrimary),
                        onPressed: _showPreferredBrandsDialog,
                      ),
                    ),
                    onSaved: (value) {
                      // No direct input here since we use dialog selection.
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Lifestyle Choices (comma separated)',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) {
                      lifestyleChoices =
                          value?.split(',').map((e) => e.trim()).toList() ?? [];
                    },
                  ),
                  SizedBox(height: 16),

                  // Budget
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Minimum Budget (in dollars)',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      minBudget = double.tryParse(value!);
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Maximum Budget (in dollars)',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      maxBudget = double.tryParse(value!);
                    },
                  ),
                  SizedBox(height: 16),

                  // Shopping Habits
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Shopping Frequency',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) {
                      shoppingFrequency = value ?? '';
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Preferred Retailers (comma separated)',
                      labelStyle: TextStyle(color: LuluBrandColor.brandPrimary),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LuluBrandColor.brandPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) {
                      preferredRetailers =
                          value?.split(',').map((e) => e.trim()).toList() ?? [];
                    },
                  ),
                  SizedBox(height: 16),

                  // User Preferences
                  SwitchListTile(
                    activeColor: LuluBrandColor.brandPrimary,
                    inactiveTrackColor: LuluBrandColor.brandGrey200,
                    inactiveThumbColor: LuluBrandColor.brandPrimary,
                    title: Text('Receive Notifications',
                        style: TextStyle(color: LuluBrandColor.brandPrimary)),
                    value: receiveNotifications,
                    onChanged: (value) {
                      setState(() {
                        receiveNotifications = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    inactiveThumbColor: LuluBrandColor.brandPrimary,
                    inactiveTrackColor: LuluBrandColor.brandGrey200,
                    activeColor: LuluBrandColor.brandPrimary,
                    title: Text('Allow Data Sharing',
                        style: TextStyle(color: LuluBrandColor.brandPrimary)),
                    value: allowDataSharing,
                    onChanged: (value) {
                      setState(() {
                        allowDataSharing = value;
                      });
                    },
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: LuluBrandColor.brandPrimary,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // Handle form submission
              _saveFormData();

              // Show the profile update splash screen after saving the form data
              GoRouter.of(context).go(profileUpdateSuccess);
            }
          },
          child: const Text(
            'Update',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
