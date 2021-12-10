import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/modules/app/app_keys.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    Key? key,
    this.title = '',
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.surface,
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: AppColors.text,
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.surface,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Text(
                title,
                style: AppTextStyles.title,
              ),
            ),
          ),
          InkWell(
            key: AppKeys.filtersButton,
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.surface,
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.filter_alt_rounded,
                  color: AppColors.text,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
