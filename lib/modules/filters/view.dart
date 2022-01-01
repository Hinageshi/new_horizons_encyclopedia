import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_horizons_encyclopedia/core/widgets/app_card.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/extensions/hour_month_extensions.dart';
import 'package:new_horizons_encyclopedia/modules/filters/notifier.dart';
import 'package:new_horizons_encyclopedia/theme/app_colors.dart';
import 'package:new_horizons_encyclopedia/theme/app_images.dart';
import 'package:new_horizons_encyclopedia/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({
    Key? key,
    required this.databaseFilters,
  }) : super(key: key);

  final DatabaseFilters databaseFilters;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FiltersNotifier>(
      create: (_) => FiltersNotifier(databaseFilters),
      child: const Scaffold(
        body: _InternalFiltersView(),
      ),
    );
  }
}

class _InternalFiltersView extends StatelessWidget {
  const _InternalFiltersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: const [
            _TopBackButton(),
            Expanded(
              child: _FiltersList(),
            ),
          ],
        )
      ],
    );
  }
}

class _TopBackButton extends StatelessWidget {
  const _TopBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FiltersNotifier>();

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 8,
        right: 8,
        bottom: 12,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => notifier.popView(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.surface,
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: AppColors.text,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FiltersList extends StatelessWidget {
  const _FiltersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: const [
        _OrderCard(),
        _FiltersCard(),
      ],
    );
  }
}

class _DropdownRow<T> extends StatefulWidget {
  const _DropdownRow({
    Key? key,
    required this.orderTitle,
    required this.value,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  final String orderTitle;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;

  @override
  __DropdownRowState<T> createState() => __DropdownRowState<T>();
}

class __DropdownRowState<T> extends State<_DropdownRow<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: Text(
            widget.orderTitle,
            style: AppTextStyles.cardBody,
            textAlign: TextAlign.end,
          ),
        ),
        const Gap(10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: DropdownButton<T>(
            isExpanded: true,
            value: widget.value,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: AppColors.text,
            ),
            iconSize: 24,
            elevation: 2,
            borderRadius: BorderRadius.circular(30),
            style: AppTextStyles.cardBody,
            dropdownColor: AppColors.surface,
            underline: Container(
              height: 1,
              color: AppColors.text,
            ),
            alignment: Alignment.center,
            onChanged: widget.onChanged,
            items: widget.items,
          ),
        ),
      ],
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FiltersNotifier>();
    final orderType = context.select(
      (FiltersNotifier notifier) => notifier.orderType,
    );
    final orderSort = context.select(
      (FiltersNotifier notifier) => notifier.orderSort,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tri',
                style: AppTextStyles.cardTitle,
              ),
              _DropdownRow<OrderType>(
                orderTitle: 'Trier par : ',
                value: orderType,
                onChanged: (OrderType? newValue) {
                  if (newValue != null) {
                    notifier.orderType = newValue;
                  }
                },
                items: OrderType.values
                    .map<DropdownMenuItem<OrderType>>((OrderType value) {
                  return DropdownMenuItem<OrderType>(
                    value: value,
                    child: Center(
                      child: Text(
                        value.toShortString(),
                      ),
                    ),
                  );
                }).toList(),
              ),
              _DropdownRow<OrderSort>(
                orderTitle: 'Ordre : ',
                value: orderSort,
                onChanged: (OrderSort? newValue) {
                  if (newValue != null) {
                    notifier.orderSort = newValue;
                  }
                },
                items: OrderSort.values
                    .map<DropdownMenuItem<OrderSort>>((OrderSort value) {
                  return DropdownMenuItem<OrderSort>(
                    value: value,
                    child: Center(
                      child: Text(
                        value.toShortString(),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FiltersCard extends StatelessWidget {
  const _FiltersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FiltersNotifier>();
    final filterTime = context.select(
      (FiltersNotifier notifier) => notifier.filterTime,
    );
    final month = context.select(
      (FiltersNotifier notifier) => notifier.month,
    );
    final filterRarity = context.select(
      (FiltersNotifier notifier) => notifier.filterRarity,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Filtres',
                style: AppTextStyles.cardTitle,
              ),
              _DropdownRow<FilterTime>(
                orderTitle: 'Temps : ',
                value: filterTime,
                onChanged: (FilterTime? newValue) {
                  if (newValue != null) {
                    notifier.filterTime = newValue;
                  }
                },
                items: FilterTime.values
                    .map<DropdownMenuItem<FilterTime>>((FilterTime value) {
                  return DropdownMenuItem<FilterTime>(
                    value: value,
                    child: Center(
                      child: Text(
                        value.toShortString(),
                      ),
                    ),
                  );
                }).toList(),
              ),
              if (filterTime == FilterTime.monthly)
                _DropdownRow<int>(
                  orderTitle: 'Mois : ',
                  value: month,
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      notifier.month = newValue;
                    }
                  },
                  items: List.generate(12, (index) => index + 1)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Center(
                        child: Text(
                          value.toString().toReadableMonth(),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              _DropdownRow<FilterRarity>(
                orderTitle: 'Rareté : ',
                value: filterRarity,
                onChanged: (FilterRarity? newValue) {
                  if (newValue != null) {
                    notifier.filterRarity = newValue;
                  }
                },
                items: FilterRarity.values
                    .map<DropdownMenuItem<FilterRarity>>((FilterRarity value) {
                  return DropdownMenuItem<FilterRarity>(
                    value: value,
                    child: Center(
                      child: Text(
                        value.toShortString(),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
