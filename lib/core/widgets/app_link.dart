import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class AppLink extends StatelessWidget {
  const AppLink({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: AppTextStyles.link,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
