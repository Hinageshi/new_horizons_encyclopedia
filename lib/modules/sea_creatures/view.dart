import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_circle_image.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_list.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_price_line.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_time_line.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_top_bar.dart';
import 'package:new_horizons_encyclopedia/core/widgets/notifier_loader.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/busy_observer.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/error_observer.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish_size.dart';
import 'package:new_horizons_encyclopedia/data/entities/movement.dart';
import 'package:new_horizons_encyclopedia/data/entities/sea_creature.dart';
import 'package:new_horizons_encyclopedia/data/repositories/sea_creatures.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/modules/sea_creatures/notifier.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class SeaCreaturesView extends StatelessWidget {
  const SeaCreaturesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<SeaCreaturesNotifier>(
      create: (_) => SeaCreaturesNotifier(),
      update: (context, notifier) => notifier!
        ..seaCreaturesRepository = context.watch<SeaCreaturesRepository>()
        ..storage = context.watch<AppwriteStorage>(),
      child: const Scaffold(
        body: NotifierLoader<SeaCreaturesNotifier>(
          child: ErrorObserver<SeaCreaturesNotifier>(
            child: BusyObserver<SeaCreaturesNotifier>(
              child: _InternalSeaCreaturesView(),
            ),
          ),
        ),
      ),
    );
  }
}

class _InternalSeaCreaturesView extends StatelessWidget {
  const _InternalSeaCreaturesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SeaCreaturesNotifier>();

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            AppTopBar(
              title: 'Créatures marines',
              onTap: () => notifier.pushFiltersViewAndReload(context),
            ),
            const Expanded(
              child: _SeaCreaturesList(),
            ),
          ],
        )
      ],
    );
  }
}

class _SeaCreaturesList extends StatelessWidget {
  const _SeaCreaturesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seaCreatures =
        context.select<SeaCreaturesNotifier, List<SeaCreature>>(
      (notifier) => notifier.seaCreatures,
    );
    final seaCreaturesImagesData =
        context.select<SeaCreaturesNotifier, List<Uint8List>>(
      (notifier) => notifier.seaCreaturesImagesData,
    );

    return AppList(
      data: seaCreatures,
      imagesData: seaCreaturesImagesData,
      itemBuilder: (context, index) => _SeaCreatureCard(
        seaCreature: seaCreatures.elementAt(index),
        imageData: seaCreaturesImagesData.elementAt(index),
      ),
    );
  }
}

class _SeaCreatureCard extends StatelessWidget {
  const _SeaCreatureCard({
    Key? key,
    required this.seaCreature,
    required this.imageData,
    this.onTap,
  }) : super(key: key);

  final SeaCreature seaCreature;
  final Uint8List imageData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: AppCard(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppCircleImage(imageData: imageData),
                      const Gap(12),
                      Text(
                        seaCreature.name,
                        style: AppTextStyles.cardTitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 24,
                  color: AppColors.text,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTimeLine(
                      month: seaCreature.month,
                      hour: seaCreature.hour,
                    ),
                    AppPriceLine(price: seaCreature.price),
                    _SeaCreatureSizeLine(size: seaCreature.size),
                    _SeaCreatureMovementLine(movement: seaCreature.movement),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SeaCreatureSizeLine extends StatelessWidget {
  const _SeaCreatureSizeLine({
    Key? key,
    required this.size,
  }) : super(key: key);

  final FishSize size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.ruler,
          scale: 4,
        ),
        const Gap(12),
        Text(
          size.toShortString(),
          style: AppTextStyles.cardBody,
        )
      ],
    );
  }
}

class _SeaCreatureMovementLine extends StatelessWidget {
  const _SeaCreatureMovementLine({
    Key? key,
    required this.movement,
  }) : super(key: key);

  final Movement movement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.seashell,
          scale: 4,
        ),
        const Gap(12),
        Text(
          movement.toShortString(),
          style: AppTextStyles.cardBody,
        )
      ],
    );
  }
}
