import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';

/// Text styles used in the app.
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle title = _AppTextStyle(
    fontFamily: 'FOT-Seurat-Pro',
    color: AppColors.text,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle cardBody = _AppTextStyle(
    fontFamily: 'FOT-Seurat-Pro',
    color: AppColors.text,
    fontSize: 12,
  );

  static const TextStyle cardTitle = _AppTextStyle(
    fontFamily: 'FOT-Seurat-Pro',
    color: AppColors.text,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle tile = _AppTextStyle(
    fontFamily: 'FOT-Seurat-Pro',
    color: AppColors.white,
    fontSize: 10,
  );

  static const TextStyle inputLabel = _AppTextStyle(
    fontFamily: 'FOT-Seurat-Pro',
    color: AppColors.text,
    fontSize: 14,
  );

  static const TextStyle buttonText = _AppTextStyle(
    fontFamily: 'FOT-Seurat-Pro',
    color: AppColors.surface,
    fontSize: 14,
  );

  static const TextStyle link = _AppTextStyle(
    fontFamily: 'FOT-Seurat-Pro',
    color: AppColors.primary,
    fontSize: 14,
  );
}

class _AppTextStyle extends TextStyle {
  const _AppTextStyle({
    FontWeight? fontWeight,
    String? fontFamily,
    Color? color,
    double? fontSize,
    double? letterSpacing,
    FontStyle fontStyle = FontStyle.normal,
  }) : super(
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          color: color,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
        );
}
