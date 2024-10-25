import 'package:flutter/widgets.dart';
import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';

class LuluIcon extends StatelessWidget {
  LuluIcon.small({super.key, this.icon, this.size}) {
    size ??= 16;
  }

  LuluIcon.medium({super.key, this.icon, this.size}) {
    size ??= 20;
  }

  LuluIcon.large({super.key, this.icon, this.size}) {
    size ??= 24;
  }
  // const LuluIcon({super.key, this.icon});
  IconData? icon;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: LuluBrandColor.brandPrimary,
    );
  }
}
