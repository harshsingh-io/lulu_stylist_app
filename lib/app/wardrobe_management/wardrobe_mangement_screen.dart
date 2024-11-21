import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/app/wardrobe_management/wardrobe_items.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/item.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/routes/routes.dart';
import 'dart:io'; // Import File

class WardrobeScreen extends StatefulWidget {
  @override
  _WardrobeScreenState createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
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
                child: _buildImage(item.imageLocalPath),
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
                    child: Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                  color: item.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    // item.isFavorite = !item.isFavorite;
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    if (imagePath.startsWith('assets/')) {
      // Load image from assets
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
      );
    } else {
      // Assume it's a file path, load image from file
      final file = File(imagePath);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
        );
      } else {
        // If the file doesn't exist, load a placeholder image
        return Image.asset(
          'assets/images/default.jpg', // Ensure you have this placeholder image
          fit: BoxFit.cover,
        );
      }
    }
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
                  onChanged: (value) {
                    // Implement search functionality if needed
                  },
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
        onPressed: () async {
          // Navigate to AddItemScreen and wait for it to return
          await GoRouter.of(context).pushNamed(addItemWardrobeRoute);
          // After returning, refresh the UI to show the new item
          setState(() {});
        },
        child: const Icon(Icons.add, color: LuluBrandColor.brandWhite),
        backgroundColor: LuluBrandColor.brandPrimary,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildGridView(tops),
          buildGridView(bottoms),
          buildGridView(shoes),
          buildGridView(accessories),
          buildGridView(innerWear),
          buildGridView(otherItems),
        ],
      ),
    );
  }

  // Function to build the grid view for each category
  Widget buildGridView(List<Item> items) {
    return GridView.builder(
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
}
