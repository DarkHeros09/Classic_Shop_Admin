import 'package:freezed_annotation/freezed_annotation.dart';

part 'color.freezed.dart';

@freezed
class ColorModel with _$ColorModel {
  const factory ColorModel({
    required int id,
    required String colorValue,
  }) = _ColorModel;
}
