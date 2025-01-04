import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/routes/routes.dart';

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<Category, List<WardrobeItem>> itemsByCategory = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: Category.values.length);
    // Load wardrobe items when screen initializes
    context.read<WardrobeBloc>().add(const WardrobeEvent.loadItems());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WardrobeBloc, WardrobeState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (failure) {
            failure.maybeWhen(
              unauthorized: () {
                context
                    .read<AuthenticationBloc>()
                    .add(const AuthenticationEvent.sessionExpired());
              },
              serverError: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message ?? 'Server error occurred')),
                );
              },
              networkError: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Network error occurred')),
                );
              },
              orElse: () {},
            );
          },
          loaded: (items, _) {
            setState(() {
              // Update items by category when items are loaded
              itemsByCategory = groupItemsByCategory(items);
            });
          },
          itemDeleted: (_) {
            // Refresh items after deletion
            context.read<WardrobeBloc>().add(const WardrobeEvent.loadItems());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item deleted successfully')),
            );
          },
          itemAdded: (_) {
            // Refresh items after addition
            context.read<WardrobeBloc>().add(const WardrobeEvent.loadItems());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added successfully')),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: LuluBrandColor.brandWhite,
          appBar: _buildAppBar(),
          floatingActionButton: _buildFloatingActionButton(),
          body: _buildBody(state),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Wardrobe',
        style: TextStyle(color: LuluBrandColor.brandWhite),
      ),
      backgroundColor: LuluBrandColor.brandPrimary,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Column(
          children: [
            _buildSearchBar(),
            _buildCategoryTabs(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: LuluBrandColor.brandPrimary,
      padding: const EdgeInsets.all(16),
      child: TextField(
        style: const TextStyle(color: LuluBrandColor.brandWhite),
        decoration: InputDecoration(
          hintText: 'Search by name or tag',
          hintStyle: TextStyle(
            color: LuluBrandColor.brandWhite.withOpacity(0.5),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: LuluBrandColor.brandWhite,
          ),
          filled: true,
          fillColor: LuluBrandColor.brandPrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: LuluBrandColor.brandWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: LuluBrandColor.brandWhite,
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          // TODO: Implement search functionality
        },
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: LuluBrandColor.blueGrey,
      indicatorColor: LuluBrandColor.brandWhite,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: LuluBrandColor.brandWhite,
      controller: _tabController,
      tabs: Category.values
          .map((category) => Tab(text: category.toString().split('.').last))
          .toList(),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        await context.pushNamed(
          addItemWardrobeRoute,
          extra: context.read<WardrobeBloc>(),
        );
        // Refresh items after returning from add item screen
        if (mounted) {
          context.read<WardrobeBloc>().add(const WardrobeEvent.loadItems());
        }
      },
      backgroundColor: LuluBrandColor.brandPrimary,
      child: const Icon(Icons.add, color: LuluBrandColor.brandWhite),
    );
  }

  Widget _buildBody(WardrobeState state) {
    return state.maybeWhen(
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (_, __) => TabBarView(
        controller: _tabController,
        children: Category.values
            .map((category) =>
                _buildCategoryGrid(itemsByCategory[category] ?? []))
            .toList(),
      ),
      error: (failure) => Center(
        child: Text(failure.maybeWhen(
          serverError: (message) => message ?? 'Server error',
          networkError: () => 'Network error',
          unauthorized: () => 'Session expired',
          orElse: () => 'Unknown error',
        )),
      ),
      orElse: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildCategoryGrid(List<WardrobeItem> items) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 48,
              color: LuluBrandColor.brandGrey300,
            ),
            const SizedBox(height: 16),
            Text(
              'No items here.',
              style: TextStyle(
                color: LuluBrandColor.brandGrey500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildItemCard(items[index]),
    );
  }

  Widget _buildItemCard(WardrobeItem item) {
    return GestureDetector(
      onTap: () async {
        final result = await context.pushNamed(
          wardrobeItemDetailRoute,
          extra: item,
        );

        if (result == true && context.mounted) {
          context.read<WardrobeBloc>().add(const WardrobeEvent.loadItems());
        }
      },
      child: Card(
        color: LuluBrandColor.brandWhite,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: _buildItemImage(item.imageUrl),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${item.brand} - ${item.size}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: LuluBrandColor.brandPrimary,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            // TODO: Implement favorite toggle functionality
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(String? imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _buildPlaceholderImage(),
            )
          : _buildPlaceholderImage(),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: LuluBrandColor.brandGrey100,
      child: const Icon(
        Icons.image,
        size: 40,
        color: LuluBrandColor.brandGrey300,
      ),
    );
  }

  Map<Category, List<WardrobeItem>> groupItemsByCategory(
      List<WardrobeItem> items) {
    return {
      for (var category in Category.values)
        category: items.where((item) => item.category == category).toList()
    };
  }
}
