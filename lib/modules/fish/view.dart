import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_circle_image.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_list.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_price_line.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_tile.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_time_line.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_top_bar.dart';
import 'package:new_horizons_encyclopedia/core/widgets/notifier_loader.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/busy_observer.dart';
import 'package:new_horizons_encyclopedia/core/widgets/observers/error_observer.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish_location.dart';
import 'package:new_horizons_encyclopedia/data/entities/fish_size.dart';
import 'package:new_horizons_encyclopedia/data/entities/rarity.dart';
import 'package:new_horizons_encyclopedia/data/repositories/fish.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/extensions/hour_month_extensions.dart';
import 'package:new_horizons_encyclopedia/modules/fish/notifier.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class FishView extends StatelessWidget {
  const FishView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<FishNotifier>(
      create: (_) => FishNotifier(),
      update: (context, notifier) => notifier!
        ..fishRepository = context.watch<FishRepository>()
        ..storage = context.watch<AppwriteStorage>(),
      child: const Scaffold(
        body: NotifierLoader<FishNotifier>(
          child: ErrorObserver<FishNotifier>(
            child: BusyObserver<FishNotifier>(
              child: _InternalFishView(),
            ),
          ),
        ),
      ),
    );
  }
}

class _InternalFishView extends StatelessWidget {
  const _InternalFishView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FishNotifier>();

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
        SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppTopBar(
                title: 'Poissons',
                onTap: () => notifier.pushFiltersViewAndReload(context),
              ),
              const Expanded(
                child: _FishList(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _FishList extends StatelessWidget {
  const _FishList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fish = context.select<FishNotifier, List<Fish>>(
      (notifier) => notifier.fish,
    );
    final fishImagesData = context.select<FishNotifier, List<Uint8List>>(
      (notifier) => notifier.fishImagesData,
    );

    return AppList(
      data: fish,
      imagesData: fishImagesData,
      itemBuilder: (context, index) => _FishCard(
        fish: fish.elementAt(index),
        imageData: fishImagesData.elementAt(index),
      ),
    );
  }
}

class _FishCard extends StatelessWidget {
  const _FishCard({
    Key? key,
    required this.fish,
    required this.imageData,
    this.onTap,
  }) : super(key: key);

  final Fish fish;
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
                        fish.name,
                        style: AppTextStyles.cardTitle,
                        textAlign: TextAlign.center,
                      ),
                      if (fish.rarity != Rarity.normal)
                        AppTile(
                          color: fish.rarity == Rarity.rare
                              ? AppColors.yellow
                              : AppColors.orange,
                          text: fish.rarity.toShortString(),
                        ),
                      if (fish.month.isSameFirstMonth())
                        const AppTile(
                          color: AppColors.green,
                          text: 'Nouveau ce mois',
                        ),
                      if (fish.month.isSameLastMonth())
                        const AppTile(
                          color: AppColors.red,
                          text: 'Dernier mois',
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
                      month: fish.month,
                      hour: fish.hour,
                    ),
                    _FishLocationLine(location: fish.location),
                    AppPriceLine(price: fish.price),
                    _FishSizeLine(size: fish.size),
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

class _FishLocationLine extends StatelessWidget {
  const _FishLocationLine({
    Key? key,
    required this.location,
  }) : super(key: key);

  final FishLocation location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.fishingRod,
          scale: 4,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            location.toShortString(),
            style: AppTextStyles.cardBody,
          ),
        ),
      ],
    );
  }
}

class _FishSizeLine extends StatelessWidget {
  const _FishSizeLine({
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
