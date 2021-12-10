import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class AppList extends StatelessWidget {
  const AppList({
    Key? key,
    this.data = const [],
    this.imagesData = const <Uint8List>[],
    required this.itemBuilder,
  }) : super(key: key);

  final List data;
  final List<Uint8List> imagesData;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty &&
            imagesData.isNotEmpty &&
            data.length == imagesData.length
        ? ListView.builder(
            itemCount: data.length,
            itemBuilder: itemBuilder,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    'Les données n\'ont pas pu être récupérées.',
                    style: AppTextStyles.cardTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
  }
}
