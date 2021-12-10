import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_horizons_encyclopedia/data/entities/bug_location.dart';
import 'package:new_horizons_encyclopedia/data/entities/rarity.dart';

part 'bug.freezed.dart';
part 'bug.g.dart';

@freezed
class Bug with _$Bug {
  const factory Bug({
    required String id,
    required String name,
    required String hour,
    required String month,
    required String price,
    required BugLocation location,
    required Rarity rarity,
    required String imageId,
  }) = _Bug;

  const Bug._();

  factory Bug.fromJson(Map<String, dynamic> json) => _$BugFromJson(json);
}
