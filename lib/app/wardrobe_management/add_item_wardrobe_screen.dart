import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lulu_stylist_app/app/view/app.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/create_wardrobe_item_request.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final List<String> selectedColors = [];
  Category _selectedCategory = Category.TOP;
  bool _isFavorite = false;
  bool _isLoading = false;
  late final WardrobeBloc _wardrobeBloc;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _wardrobeBloc = context.read<WardrobeBloc>();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    brandController.dispose();
    priceController.dispose();
    sizeController.dispose();
    notesController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  Future<void> selectImage() async {
    try {
      if (!mounted) return;

      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (image != null && mounted) {
        final file = File(image.path);
        final sizeInBytes = await file.length();
        final sizeInMb = sizeInBytes / (1024 * 1024);

        if (sizeInMb > 5) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image size should be less than 5MB')),
          );
          return;
        }

        // Prevent unnecessary rebuilds
        if (mounted) {
          setState(() {
            imagePath = image.path;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error selecting image: $e')),
        );
      }
      print('Error selecting image: $e');
    }
  }

  void _addColor(String color) {
    if (!selectedColors.contains(color)) {
      setState(() {
        selectedColors.add(color);
      });
    }
  }

  void _removeColor(String color) {
    setState(() {
      selectedColors.remove(color);
    });
  }

  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) return;

    // Add image validation
    if (imagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return;
    }

    if (selectedColors.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one color')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Parse tags
      final tags = tagsController.text
          .split(',')
          .where((tag) => tag.trim().isNotEmpty)
          .map((tag) => tag.trim())
          .toList();

      // Create request
      final request = CreateWardrobeItemRequest(
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        colors: selectedColors,
        brand: brandController.text.trim(),
        category: _selectedCategory
            .toString()
            .split('.')
            .last, // Convert enum to string
        isFavorite: _isFavorite,
        price: double.parse(priceController.text),
        notes: notesController.text.trim(),
        size: sizeController.text.trim(),
        tags: tags,
      );

      // Debug log request
      print('Request body: ${request.toJson()}');

      context.read<WardrobeBloc>().add(WardrobeEvent.addItem(request));
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WardrobeBloc, WardrobeState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (failure) {
            setState(() => _isLoading = false);
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.toString()),
                backgroundColor: Colors.red,
              ),
            );
          },
          loaded: (items, _) {
            setState(() => _isLoading = false);
            // Show success message and pop
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item added successfully'),
                backgroundColor: Colors.green,
              ),
            );
            context.pop(true);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add New Item',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: LuluBrandColor.brandPrimary,
          elevation: 0,
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      LuluBrandColor.brandPrimary.withAlpha(200),
                      Colors.white,
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildFormSection(
                            title: 'Basic Information',
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: selectImage,
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      image: imagePath != null
                                          ? DecorationImage(
                                              image:
                                                  FileImage(File(imagePath!)),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: imagePath == null
                                        ? const Icon(
                                            Icons.add_a_photo,
                                            size: 40,
                                            color: Colors.grey,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: nameController,
                                label: 'Name',
                                isRequired: true,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: descriptionController,
                                label: 'Description',
                                isRequired: true,
                                maxLines: 3,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildFormSection(
                            title: 'Details',
                            children: [
                              _buildColorSelector(),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: brandController,
                                label: 'Brand',
                                isRequired: true,
                              ),
                              const SizedBox(height: 16),
                              _buildCategoryDropdown(),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildTextField(
                                      controller: priceController,
                                      label: 'Price',
                                      isRequired: true,
                                      keyboardType: TextInputType.number,
                                      prefix: '\$',
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: _buildTextField(
                                      controller: sizeController,
                                      label: 'Size',
                                      isRequired: true,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildFormSection(
                            title: 'Additional Information',
                            children: [
                              _buildTextField(
                                controller: notesController,
                                label: 'Notes',
                                maxLines: 3,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: tagsController,
                                label: 'Tags',
                                hint: 'casual, summer, favorite',
                              ),
                              SwitchListTile(
                                title: const Text('Add to Favorites'),
                                value: _isFavorite,
                                onChanged: (value) =>
                                    setState(() => _isFavorite = value),
                                activeColor: LuluBrandColor.brandPrimary,
                                tileColor: LuluBrandColor.brandWhite,
                                inactiveTrackColor: LuluBrandColor.brandWhite,
                                inactiveThumbColor: LuluBrandColor.brandPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                    color: LuluBrandColor.brandPrimary,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: _saveItem,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: LuluBrandColor.brandPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              'Save Item',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildFormSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LuluBrandColor.brandPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isRequired = false,
    int maxLines = 1,
    String? hint,
    TextInputType? keyboardType,
    String? prefix,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '$label${isRequired ? '*' : ''}',
        labelStyle: const TextStyle(color: LuluBrandColor.brandPrimary),
        hintText: hint,
        prefixText: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: LuluBrandColor.brandPrimary),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: isRequired
          ? (value) => value?.isEmpty == true ? '$label is required' : null
          : null,
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<Category>(
      value: _selectedCategory,
      decoration: InputDecoration(
        labelText: 'Category*',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      items: Category.values.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category.toString().split('.').last),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() => _selectedCategory = value);
        }
      },
    );
  }

  Widget _buildColorSelector() {
    final List<String> availableColors = [
      'Red',
      'Blue',
      'Green',
      'Yellow',
      'Black',
      'White',
      'Pink',
      'Purple'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Colors*',
          style: TextStyle(color: LuluBrandColor.brandPrimary),
        ),
        Wrap(
          spacing: 8,
          children: availableColors.map((color) {
            final isSelected = selectedColors.contains(color);
            return FilterChip(
              selected: isSelected,
              backgroundColor: LuluBrandColor.brandWhite,
              selectedColor: LuluBrandColor.brandPrimary,
              checkmarkColor: LuluBrandColor.brandWhite,
              side: const BorderSide(
                color: LuluBrandColor.brandAccentMidNightAqua,
              ),
              label: Text(
                color,
                style: TextStyle(
                  color: isSelected ? LuluBrandColor.brandWhite : Colors.black,
                ),
              ),
              onSelected: (selected) {
                if (selected) {
                  _addColor(color);
                } else {
                  _removeColor(color);
                }
              },
            );
          }).toList(),
        ),
        if (selectedColors.isEmpty)
          const Text(
            'Please select at least one color',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }
}
