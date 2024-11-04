// lib/screens/wardrobe_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/add_item_wardrobe_screen.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/local/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/local/item.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_event.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_state.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class WardrobeScreen extends StatefulWidget {
  @override
  _WardrobeScreenState createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
// lib/screens/wardrobe_screen.dart

// Add this list inside your _WardrobeScreenState class
  final List<Category> categories = [
    Category.TOP,
    Category.BOTTOM,
    Category.SHOES,
    Category.ACCESSORIES,
    Category.INNERWEAR,
    Category.OTHER,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);

    // Fetch all items when the screen initializes
    context.read<WardrobeBloc>().add(FetchAllWardrobeItems());
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  Widget buildItemCard(Item item) {
    return Card(
      color: LuluBrandColor.brandWhite,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8), // Adjust the radius as needed
                ),
                child: Image.file(
                  File(item.imageLocalPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('${item.brand} - ${item.size}'),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  item.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: item.isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  // Toggle favorite status
                  final updatedItem = Item(
                    id: item.id,
                    name: item.name,
                    createdAt: item.createdAt,
                    colors: item.colors,
                    brand: item.brand,
                    category: item.category,
                    isFavorite: !item.isFavorite,
                    price: item.price,
                    userId: item.userId,
                    imageLocalPath: item.imageLocalPath,
                    imageData: item.imageData,
                    notes: item.notes,
                    size: item.size,
                    tags: item.tags,
                  );
                  context
                      .read<WardrobeBloc>()
                      .add(UpdateWardrobeItem(updatedItem));
                },
              )
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildGridView(List<Item> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.5),
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return buildItemCard(items[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuluBrandColor.brandWhite,
      appBar: AppBar(
        title: const Text('Wardrobe',
            style: TextStyle(color: LuluBrandColor.brandWhite)),
        backgroundColor: LuluBrandColor.brandPrimary,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130.0), // Adjust the height here
          child: Column(
            children: [
              Container(
                color: LuluBrandColor.brandPrimary, // Set the background color
                padding:
                    const EdgeInsets.all(16), // Padding around the search bar
                child: TextField(
                  onChanged: (query) {
                    // Implement search functionality
                    // You can dispatch a search event to the Bloc here
                  },
                  style: const TextStyle(
                      color: LuluBrandColor.brandWhite), // Text color
                  decoration: InputDecoration(
                    hintText: 'Search by name or tag',
                    hintStyle: TextStyle(
                        color: LuluBrandColor.brandWhite
                            .withOpacity(0.5)), // Hint text color
                    prefixIcon: const Icon(Icons.search,
                        color: LuluBrandColor.brandWhite), // Search icon color
                    filled: true,
                    fillColor: LuluBrandColor
                        .brandPrimary, // Fill color same as background
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                      borderSide: BorderSide.none, // No border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: LuluBrandColor.brandWhite,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                          color: LuluBrandColor.brandWhite, width: 2),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: LuluBrandColor.brandGrey200),
                    ),
                  ),
                ),
              ),
              TabBar(
                isScrollable: true,
                unselectedLabelColor: LuluBrandColor.blueGrey,
                indicatorColor: LuluBrandColor.brandWhite,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: LuluBrandColor.brandWhite,
                controller: _tabController,
                tabs: const [
                  Tab(text: 'TOP'),
                  Tab(text: 'BOTTOM'),
                  Tab(text: 'SHOES'),
                  Tab(text: 'ACCESSORIES'),
                  Tab(text: 'INNERWEAR'),
                  Tab(text: 'OTHER'),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Item Screen
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
        child: const Icon(Icons.add, color: LuluBrandColor.brandWhite),
        backgroundColor: LuluBrandColor.brandPrimary,
      ),
      body: BlocBuilder<WardrobeBloc, WardrobeState>(
        builder: (context, state) {
          if (state is WardrobeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WardrobeLoaded) {
            // Access the current tab's category using the categories list
            Category currentCategory = categories[_tabController!.index];

            // Filter items based on the current category
            List<Item> filteredItems = state.items
                .where((item) => item.category == currentCategory)
                .toList();

            return TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                List<Item> categoryItems = state.items
                    .where((item) => item.category == category)
                    .toList();
                return buildGridView(categoryItems);
              }).toList(),
            );
          } else if (state is WardrobeOperationFailure) {
            return Center(child: Text('Error: ${state.message}'));
          }
          // Default fallback
          return TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('No items found.')),
              Center(child: Text('No items found.')),
              Center(child: Text('No items found.')),
              Center(child: Text('No items found.')),
              Center(child: Text('No items found.')),
              Center(child: Text('No items found.')),
            ],
          );
        },
      ),
    );
  }
}
