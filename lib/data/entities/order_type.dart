import 'package:flutter/widgets.dart';
import 'package:new_horizons_encyclopedia/l10n/l10n.dart';

enum OrderType {
  id,
  name,
  price,
  rarity,
}

extension OrderTypeExtension on OrderType {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case OrderType.id:
        return l10n.order_type_id;
      case OrderType.name:
        return l10n.order_type_name;
      case OrderType.price:
        return l10n.order_type_price;
      case OrderType.rarity:
        return l10n.order_type_rarity;
    }
  }

  String toDatabaseField() {
    switch (this) {
      case OrderType.id:
        return 'id';
      case OrderType.name:
        return 'name';
      case OrderType.price:
        return 'price';
      case OrderType.rarity:
        return 'rarity';
    }
  }
}

enum OrderSort {
  asc,
  desc,
}

extension OrderSortExtension on OrderSort {
  String toShortString(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case OrderSort.asc:
        return l10n.order_sort_asc;
      case OrderSort.desc:
        return l10n.order_sort_desc;
    }
  }

  String toDatabaseSort() {
    switch (this) {
      case OrderSort.asc:
        return 'ASC';
      case OrderSort.desc:
        return 'DESC';
    }
  }
}

enum OrderCast {
  int,
  string,
  date,
  time,
  datetime,
}

extension OrderCastExtension on OrderCast {
  String toDatabaseCast() {
    switch (this) {
      case OrderCast.int:
        return 'int';
      case OrderCast.string:
        return 'string';
      case OrderCast.date:
        return 'date';
      case OrderCast.time:
        return 'time';
      case OrderCast.datetime:
        return 'datetime';
    }
  }
}
