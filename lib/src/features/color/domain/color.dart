import 'package:freezed_annotation/freezed_annotation.dart';

part 'color.freezed.dart';

@freezed
class Color with _$Color {
  const factory Color({
    required int id,
    required String colorValue,
  }) = _Color;
}
