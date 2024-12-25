import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
          title: const Text('Add New Item'),
          backgroundColor: LuluBrandColor.brandPrimary,
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name*',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value?.isEmpty == true
                              ? 'Name is required'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Description*',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value?.isEmpty == true
                              ? 'Description is required'
                              : null,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 16),
                        _buildColorSelector(),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: brandController,
                          decoration: const InputDecoration(
                            labelText: 'Brand*',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value?.isEmpty == true
                              ? 'Brand is required'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<Category>(
                          value: _selectedCategory,
                          decoration: const InputDecoration(
                            labelText: 'Category*',
                            border: OutlineInputBorder(),
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
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: priceController,
                          decoration: const InputDecoration(
                            labelText: 'Price*',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value?.isEmpty == true)
                              return 'Price is required';
                            if (double.tryParse(value!) == null)
                              return 'Invalid price';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: sizeController,
                          decoration: const InputDecoration(
                            labelText: 'Size*',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value?.isEmpty == true
                              ? 'Size is required'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: notesController,
                          decoration: const InputDecoration(
                            labelText: 'Notes',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: tagsController,
                          decoration: const InputDecoration(
                            labelText: 'Tags (comma-separated)',
                            border: OutlineInputBorder(),
                            hintText: 'casual, summer, favorite',
                          ),
                        ),
                        const SizedBox(height: 16),
                        SwitchListTile(
                          title: const Text('Favorite'),
                          value: _isFavorite,
                          onChanged: (value) =>
                              setState(() => _isFavorite = value),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _saveItem,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LuluBrandColor.brandPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Save Item',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
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
        const Text('Colors*'),
        Wrap(
          spacing: 8,
          children: availableColors.map((color) {
            final isSelected = selectedColors.contains(color);
            return FilterChip(
              selected: isSelected,
              label: Text(color),
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
