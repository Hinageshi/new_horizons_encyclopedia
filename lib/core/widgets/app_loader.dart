import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Padding(
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(
          color: AppColors.text,
        ),
      ),
    );
  }
}
