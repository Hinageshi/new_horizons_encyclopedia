import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class AppTile extends StatelessWidget {
  const AppTile({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            text,
            style: AppTextStyles.tile,
          ),
        ),
      ),
    );
  }
}
