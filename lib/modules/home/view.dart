import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/modules/bugs/view.dart';
import 'package:new_horizons_encyclopedia/modules/fish/view.dart';
import 'package:new_horizons_encyclopedia/modules/sea_creatures/view.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              AppImages.critterpedia,
              scale: 1.5,
            ),
          ),
          _HomeCard(
            title: 'Poissons',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FishView(),
              ),
            ),
          ),
          _HomeCard(
            title: 'Insectes',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BugsView(),
              ),
            ),
          ),
          _HomeCard(
            title: 'Créatures marines',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SeaCreaturesView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: AppCard(
        onTap: onTap,
        height: 150,
        elevation: 2,
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.title,
          ),
        ),
      ),
    );
  }
}
