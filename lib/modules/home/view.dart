import 'package:flutter/material.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';
import 'package:new_horizons_encyclopedia/modules/bugs/view.dart';
import 'package:new_horizons_encyclopedia/modules/fish/view.dart';
import 'package:new_horizons_encyclopedia/modules/sea_creatures/view.dart';
import 'package:new_horizons_encyclopedia/modules/user_profile/view.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Stack(
        children: [
          Column(
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
                title: l10n.common_fish,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FishView(),
                  ),
                ),
              ),
              _HomeCard(
                title: l10n.common_bugs,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BugsView(),
                  ),
                ),
              ),
              _HomeCard(
                title: l10n.common_sea_creatures,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SeaCreaturesView(),
                  ),
                ),
              ),
            ],
          ),
          const SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: _UserButton(),
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

class _UserButton extends StatelessWidget {
  const _UserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const UserProfileView(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.surface,
        ),
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(
            Icons.person_rounded,
            color: AppColors.text,
            size: 30,
          ),
        ),
      ),
    );
  }
}
