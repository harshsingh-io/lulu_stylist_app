import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class WardrobeScreen extends StatefulWidget {
  @override
  _WardrobeScreenState createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  // Sample data for each category
  final List<Map<String, String>> tops = [
    {'name': 'Picasso Rouge', 'brand': 'The Breton Shirt', 'size': 'M'},
    {'name': 'Summer T-Shirt', 'brand': 'Zara', 'size': 'L'},
  ];

  final List<Map<String, String>> bottoms = [
    {'name': 'Jeans', 'brand': 'Levi\'s', 'size': '32'},
    {'name': 'Chinos', 'brand': 'Gap', 'size': 'M'},
  ];

  final List<Map<String, String>> shoes = [
    {'name': 'Sneakers', 'brand': 'Nike', 'size': '42'},
    {'name': 'Boots', 'brand': 'Timberland', 'size': '43'},
  ];

  final List<Map<String, String>> accessories = [
    {'name': 'Watch', 'brand': 'Rolex'},
    {'name': 'Hat', 'brand': 'Gucci'},
  ];

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

  Widget buildItemCard(Map<String, String> item) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(item['name']!),
        subtitle: Text('${item['brand']} - ${item['size']}'),
        trailing: const Icon(Icons.favorite_border),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wardrobe',
            style: TextStyle(color: LuluBrandColor.brandWhite)),
        backgroundColor: LuluBrandColor.brandPrimary,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130.0), // Adjust the height here
          child: Column(
            children: [
              Container(
                color: LuluBrandColor.brandPrimary, // Set the background color
                padding: EdgeInsets.all(16), // Padding around the search bar
                child: TextField(
                  style:
                      TextStyle(color: LuluBrandColor.brandWhite), // Text color
                  decoration: InputDecoration(
                    hintText: 'Search by name or tag',
                    hintStyle: TextStyle(
                        color: LuluBrandColor.brandWhite
                            .withOpacity(0.5)), // Hint text color
                    prefixIcon: Icon(Icons.search,
                        color: LuluBrandColor.brandWhite), // Search icon color
                    filled: true,
                    fillColor: LuluBrandColor
                        .brandPrimary, // Fill color same as background
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                      borderSide: BorderSide(
                          color: LuluBrandColor.brandWhite), // Outline color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: LuluBrandColor.brandWhite),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: LuluBrandColor.brandWhite, width: 2),
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
          GoRouter.of(context).pushNamed(
            addItemWardrobeRoute,
          );
          print('Add new item');
        },
        child: Icon(Icons.add, color: LuluBrandColor.brandWhite),
        backgroundColor: LuluBrandColor.brandPrimary,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (1 / 1.5),
            children: List.generate(10, (index) {
              // Placeholder for items
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT5FOqO6j8mnrixStZe9cNstEuM-HVzI4wyyZuctsUb5jhABR2djwVYdjGR7mM13Q3dSdVb3S6DmmmOHc0pUNKEnMVZlEF6-QdAas1xQrABs4RqJJGAv6QfIUo'), // Placeholder image
                    ),
                    Text('Item $index'),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
              );
            }),
          ),
          ListView.builder(
            itemCount: bottoms.length,
            itemBuilder: (context, index) {
              return buildItemCard(bottoms[index]);
            },
          ),
          ListView.builder(
            itemCount: bottoms.length,
            itemBuilder: (context, index) {
              return buildItemCard(bottoms[index]);
            },
          ),
          ListView.builder(
            itemCount: bottoms.length,
            itemBuilder: (context, index) {
              return buildItemCard(bottoms[index]);
            },
          ),
          ListView.builder(
            itemCount: shoes.length,
            itemBuilder: (context, index) {
              return buildItemCard(shoes[index]);
            },
          ),
          ListView.builder(
            itemCount: accessories.length,
            itemBuilder: (context, index) {
              return buildItemCard(accessories[index]);
            },
          ),
        ],
      ),
    );
  }
}
