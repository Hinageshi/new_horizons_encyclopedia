import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    this.onTap,
    this.height,
    this.width,
    this.borderRadius,
    this.elevation,
    this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? elevation;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 30,
            ),
          ),
          color: AppColors.surface,
          shadowColor: AppColors.shadow,
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}
