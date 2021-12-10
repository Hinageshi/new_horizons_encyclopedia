import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';

part 'database_filters.freezed.dart';
part 'database_filters.g.dart';

@freezed
class DatabaseFilters with _$DatabaseFilters {
  const factory DatabaseFilters({
    required OrderType orderType,
    required OrderSort orderSort,
    required OrderCast orderCast,
    required FilterTime filterTime,
    required int? month,
    required FilterRarity filterRarity,
  }) = _DatabaseFilters;

  const DatabaseFilters._();

  factory DatabaseFilters.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFiltersFromJson(json);
}
