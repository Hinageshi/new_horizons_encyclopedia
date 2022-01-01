import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/core/notifiers/safe_change_notifier.dart';
import 'package:new_horizons_encyclopedia/data/entities/database_filters.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_rarity.dart';
import 'package:new_horizons_encyclopedia/data/entities/filter_time.dart';
import 'package:new_horizons_encyclopedia/data/entities/order_type.dart';

class FiltersNotifier extends SafeChangeNotifier {
  FiltersNotifier(
    DatabaseFilters databaseFilters,
  )   : _orderType = databaseFilters.orderType,
        _orderCast = databaseFilters.orderCast,
        _orderSort = databaseFilters.orderSort,
        _filterTime = databaseFilters.filterTime,
        _month = databaseFilters.month ?? DateTime.now().month,
        _filterRarity = databaseFilters.filterRarity;

  OrderType get orderType => _orderType;
  OrderType _orderType;
  set orderType(OrderType value) {
    if (_orderType != value) {
      _orderType = value;
      switch (_orderType) {
        case OrderType.id:
        case OrderType.price:
          _orderCast = OrderCast.int;
          break;
        case OrderType.name:
        case OrderType.rarity:
          _orderCast = OrderCast.string;
          break;
      }
      notifyListeners();
    }
  }

  OrderCast _orderCast;

  OrderSort get orderSort => _orderSort;
  OrderSort _orderSort;
  set orderSort(OrderSort value) {
    if (_orderSort != value) {
      _orderSort = value;
      notifyListeners();
    }
  }

  FilterTime get filterTime => _filterTime;
  FilterTime _filterTime;
  set filterTime(FilterTime value) {
    if (_filterTime != value) {
      _filterTime = value;
      notifyListeners();
    }
  }

  int get month => _month;
  int _month;
  set month(int value) {
    if (_month != value) {
      _month = value;
      notifyListeners();
    }
  }

  FilterRarity get filterRarity => _filterRarity;
  FilterRarity _filterRarity;
  set filterRarity(FilterRarity value) {
    if (_filterRarity != value) {
      _filterRarity = value;
      notifyListeners();
    }
  }

  void popView(BuildContext context) {
    Navigator.pop<DatabaseFilters>(
      context,
      DatabaseFilters(
        orderType: _orderType,
        orderSort: _orderSort,
        orderCast: _orderCast,
        filterTime: _filterTime,
        month: _filterTime == FilterTime.all
            ? null
            : _filterTime == FilterTime.currently
                ? DateTime.now().month
                : _month,
        filterRarity: _filterRarity,
      ),
    );
  }
}
