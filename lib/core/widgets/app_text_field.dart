import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.controller,
    required this.title,
    required this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String title;
  final IconData prefixIcon;
  final Widget? suffix;
  final IconData? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: AppTextStyles.inputLabel,
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: Icon(prefixIcon),
        suffix: suffix,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.text,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        labelStyle: AppTextStyles.inputLabel,
      ),
    );
  }
}
