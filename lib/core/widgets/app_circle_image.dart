import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';

class AppCircleImage extends StatelessWidget {
  const AppCircleImage({
    Key? key,
    required this.imageData,
  }) : super(key: key);

  final Uint8List imageData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: imageData.isNotEmpty
            ? Image.memory(imageData)
            : Image.asset(AppImages.error),
      ),
    );
  }
}
