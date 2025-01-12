import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/bloc/wardrobe_bloc.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/sa_spacing.dart';

class WardrobeItemDetailScreen extends StatelessWidget {
  final WardrobeItem item;

  const WardrobeItemDetailScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WardrobeBloc, WardrobeState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  failure.maybeWhen(
                    serverError: (message) =>
                        message ?? 'Server error occurred',
                    networkError: () => 'Network error occurred',
                    unauthorized: () => 'Session expired',
                    orElse: () => 'An error occurred',
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          loaded: (_, __) {
            // Show success message before navigation
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item deleted successfully'),
                backgroundColor: Colors.green,
              ),
            );

            // Navigate back to wardrobe management screen
            // if (context.mounted) {
            //   context.pop();
            //   // Refresh wardrobe items
            //   context.read<WardrobeBloc>().add(const WardrobeEvent.loadItems());
            // }
            if (context.mounted) {
              context.pop(true); // Pass true to indicate successful deletion
            }
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: LuluBrandColor.brandWhite,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  LuluBrandColor.brandSecondary,
                  LuluBrandColor.expertDashBoardGreen,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          title: Text(
            'Item Details',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: LuluBrandColor.brandWhite, fontWeight: FontWeight.bold),
          ),
          backgroundColor: LuluBrandColor.brandPrimary,
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: LuluBrandColor.brandWhite,
              ),
              onPressed: () {
                // TODO: Navigate to edit screen
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: LuluBrandColor.brandWhite,
              ),
              onPressed: () => _showDeleteConfirmation(context),
            ),
          ],
        ),
        body: BlocBuilder<WardrobeBloc, WardrobeState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildImageSection(),
                      Padding(
                        padding: EdgeInsets.all(LuluSpacing.md.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeaderSection(),
                            SizedBox(height: LuluSpacing.md.h),
                            _buildDetailsSection(),
                            SizedBox(height: LuluSpacing.md.h),
                            _buildColorSection(),
                            SizedBox(height: LuluSpacing.md.h),
                            _buildTagsSection(),
                            SizedBox(height: LuluSpacing.md.h),
                            _buildNotesSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                state.maybeWhen(
                  loading: () => Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        color: LuluBrandColor.brandGrey100,
      ),
      child: item.imageUrl != null
          ? Image.network(
              item.imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _buildPlaceholderImage(),
            )
          : _buildPlaceholderImage(),
    );
  }

  Widget _buildPlaceholderImage() {
    return Center(
      child: Icon(
        Icons.image,
        size: 60.sp,
        color: LuluBrandColor.brandGrey300,
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.name,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: LuluBrandColor.brandPrimary,
                ),
              ),
            ),
            Icon(
              item.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: item.isFavorite ? Colors.red : LuluBrandColor.brandGrey300,
              size: 24.sp,
            ),
          ],
        ),
        SizedBox(height: LuluSpacing.xs.h),
        Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: LuluBrandColor.brandSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection() {
    return Container(
      decoration: BoxDecoration(
        color: LuluBrandColor.brandGrey100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.all(LuluSpacing.md.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Brand', item.brand),
          _buildDetailRow('Size', item.size),
          _buildDetailRow(
            'Category',
            item.category.toString().split('.').last,
          ),
          _buildDetailRow(
            'Description',
            item.description,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: TextStyle(
                color: LuluBrandColor.brandGrey500,
                fontSize: 14.sp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                color: LuluBrandColor.brandGrey500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colors',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: LuluBrandColor.brandGrey500,
          ),
        ),
        SizedBox(height: LuluSpacing.xs.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: item.colors.map((color) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: LuluBrandColor.brandGrey100,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                color,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: LuluBrandColor.brandGrey500,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTagsSection() {
    if (item.tags.isEmpty) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: LuluBrandColor.brandGrey500,
          ),
        ),
        SizedBox(height: LuluSpacing.xs.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: item.tags.map((tag) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: LuluBrandColor.brandPrimary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                '#${tag.name}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: LuluBrandColor.brandPrimary,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildNotesSection() {
    if (item.notes?.isEmpty ?? true) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notes',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: LuluBrandColor.brandGrey500,
          ),
        ),
        SizedBox(height: LuluSpacing.xs.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(LuluSpacing.md.w),
          decoration: BoxDecoration(
            color: LuluBrandColor.brandGrey100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            item.notes!,
            style: TextStyle(
              fontSize: 14.sp,
              color: LuluBrandColor.brandGrey500,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete Item',
            style: TextStyle(
              color: LuluBrandColor.brandPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete "${item.name}"? This action cannot be undone.',
            style: TextStyle(color: LuluBrandColor.brandGrey500),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancel',
                style: TextStyle(color: LuluBrandColor.brandGrey500),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      context.read<WardrobeBloc>().add(WardrobeEvent.deleteItem(item.id));
    }
  }
}
