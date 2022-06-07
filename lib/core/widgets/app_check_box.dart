import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    Key? key,
    required this.value,
    this.onChanged,
    this.width = 30,
    this.height = 30,
  }) : super(key: key);

  final bool value;
  final void Function(bool?)? onChanged;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Checkbox(
        value: value,
        activeColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onChanged: onChanged ?? (_) {},
      ),
    );
  }
}
