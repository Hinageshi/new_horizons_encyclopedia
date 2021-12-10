import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:new_horizons_encyclopedia/data/entities/bug.dart';
import 'package:new_horizons_encyclopedia/data/entities/bug_location.dart';
import 'package:new_horizons_encyclopedia/data/repositories/bugs.dart';
import 'package:new_horizons_encyclopedia/data/sources/appwrite_storage.dart';
import 'package:new_horizons_encyclopedia/modules/bugs/notifier.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class BugsView extends StatelessWidget {
  const BugsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider0<BugsNotifier>(
      create: (_) => BugsNotifier(),
      update: (context, notifier) => notifier!
        ..bugsRepository = context.watch<BugsRepository>()
        ..storage = context.watch<AppwriteStorage>(),
      child: const Scaffold(
        body: NotifierLoader<BugsNotifier>(
          child: ErrorObserver<BugsNotifier>(
            child: BusyObserver<BugsNotifier>(
              child: _InternalBugsView(),
            ),
          ),
        ),
      ),
    );
  }
}

class _InternalBugsView extends StatelessWidget {
  const _InternalBugsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<BugsNotifier>();

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
              title: 'Insectes',
              onTap: () => notifier.pushFiltersViewAndReload(context),
            ),
            const Expanded(
              child: _BugsList(),
            ),
          ],
        )
      ],
    );
  }
}

class _BugsList extends StatelessWidget {
  const _BugsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bugs = context.select<BugsNotifier, List<Bug>>(
      (notifier) => notifier.bugs,
    );
    final bugsImagesData = context.select<BugsNotifier, List<Uint8List>>(
      (notifier) => notifier.bugsImagesData,
    );

    return AppList(
      data: bugs,
      imagesData: bugsImagesData,
      itemBuilder: (context, index) => _BugCard(
        bug: bugs.elementAt(index),
        imageData: bugsImagesData.elementAt(index),
      ),
    );
  }
}

class _BugCard extends StatelessWidget {
  const _BugCard({
    Key? key,
    required this.bug,
    required this.imageData,
    this.onTap,
  }) : super(key: key);

  final Bug bug;
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
                        bug.name,
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
                      month: bug.month,
                      hour: bug.hour,
                    ),
                    _BugLocationLine(location: bug.location),
                    AppPriceLine(price: bug.price),
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

class _BugLocationLine extends StatelessWidget {
  const _BugLocationLine({
    Key? key,
    required this.location,
  }) : super(key: key);

  final BugLocation location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.net,
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
