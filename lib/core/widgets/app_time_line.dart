import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/extensions/hour_month_extensions.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class AppTimeLine extends StatelessWidget {
  const AppTimeLine({
    Key? key,
    required this.month,
    required this.hour,
  }) : super(key: key);

  final String month;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.chrono,
          scale: 4,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                month.toReadableMonth(),
                style: AppTextStyles.cardBody,
              ),
              Text(
                hour.toReadableHour(),
                style: AppTextStyles.cardBody,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
