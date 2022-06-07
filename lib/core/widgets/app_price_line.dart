import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class AppPriceLine extends StatelessWidget {
  const AppPriceLine({
    Key? key,
    required this.price,
  }) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.bell,
          scale: 4,
        ),
        const Gap(12),
        Text(
          price.toString(),
          style: AppTextStyles.cardBody,
        ),
      ],
    );
  }
}
