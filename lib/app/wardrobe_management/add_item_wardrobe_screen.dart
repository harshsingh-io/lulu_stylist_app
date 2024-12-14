import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_items.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/tag.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:nanoid/nanoid.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  File? _image;
  final DateTime _createdAt = DateTime.now();
  bool _isFavorite = false;
  Category _selectedCategory = Category.TOP;

  final ImagePicker _picker = ImagePicker();
  void saveItem() {
    if (_formKey.currentState!.validate()) {
      // Generate a new ID using nanoid
      final newId = nanoid();

      // Parse tags from the comma-separated input
      final parsedTags = tagsController.text
          .split(',')
          .map((tag) => Tag(id: nanoid(), name: tag.trim()))
          .toList();

      // Determine image paths and data
      final imagePath =
          _image != null ? _image!.path : 'assets/images/default.jpg';
      final imageData = _image != null
          ? 'base64'
          : 'base64'; // Placeholder for actual base64 encoding

      // Create a new Item instance
      final newItem = WardrobeItem(
        id: newId,
        name: nameController.text,
        createdAt: DateTime.now(),
        colors: [
          'Unspecified',
        ], // You can add a color picker in the form for better input
        brand: brandController.text,
        category: _selectedCategory,
        isFavorite: _isFavorite,
        price: double.parse(priceController.text),
        userId: 'user_001', // Replace with actual user ID if available
        imageLocalPath: imagePath,
        imageData: imageData,
        notes: notesController.text,
        size: sizeController.text,
        tags: parsedTags,
      );

      // Add the new item to the appropriate list
      switch (_selectedCategory) {
        case Category.TOP:
          tops.add(newItem);
        case Category.BOTTOM:
          bottoms.add(newItem);
        case Category.INNERWEAR:
          innerWear.add(newItem);
        case Category.ACCESSORIES:
          accessories.add(newItem);
        case Category.SHOES:
          shoes.add(newItem);
        case Category.OTHER:
          otherItems.add(newItem);
        default:
          otherItems.add(newItem);
      }

      // Optionally, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item "${newItem.name}" added successfully!')),
      );

      // Navigate back to the previous screen after a short delay to allow the SnackBar to display
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
        backgroundColor: LuluBrandColor.brandPrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () => _pickImage(ImageSource.gallery),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: _image == null
                                  ? const SizedBox(
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_a_photo,
                                            size: 50,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Tap to add an image',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 150,
                                      ),
                                    ),
                            ),
                          ),
                          if (_image != null)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon:
                                    const Icon(Icons.cancel, color: Colors.red),
                                onPressed: _removeImage,
                                tooltip: 'Remove Image',
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a name' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: brandController,
                      decoration: InputDecoration(
                        labelText: 'Brand',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a brand' : null,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<Category>(
                      value: _selectedCategory,
                      items: Category.values.map((Category category) {
                        return DropdownMenuItem<Category>(
                          value: category,
                          child: Text(category.toString().split('.').last),
                        );
                      }).toList(),
                      onChanged: (Category? newValue) {
                        setState(() {
                          _selectedCategory = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Favorite'),
                      value: _isFavorite,
                      onChanged: (bool value) {
                        setState(() {
                          _isFavorite = value;
                        });
                      },
                      activeColor: LuluBrandColor.brandPrimary,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a price' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: sizeController,
                      decoration: InputDecoration(
                        labelText: 'Size',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a size' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: notesController,
                      decoration: InputDecoration(
                        labelText: 'Notes',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: tagsController,
                      decoration: InputDecoration(
                        labelText: 'Tags (comma-separated)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: saveItem,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LuluBrandColor.brandPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 16, color: Colors.white),
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
}
