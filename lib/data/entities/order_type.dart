enum OrderType {
  id,
  name,
  price,
  rarity,
}

extension OrderTypeExtension on OrderType {
  String toShortString() {
    switch (this) {
      case OrderType.id:
        return 'ID';
      case OrderType.name:
        return 'Nom';
      case OrderType.price:
        return 'Prix';
      case OrderType.rarity:
        return 'Rareté';
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
  String toShortString() {
    switch (this) {
      case OrderSort.asc:
        return 'Croissant';
      case OrderSort.desc:
        return 'Décroissant';
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
