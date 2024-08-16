import 'package:freezed_annotation/freezed_annotation.dart';

part 'size.freezed.dart';

@freezed
class Size with _$Size {
  const factory Size({
    required int id,
    required String sizeValue,
  }) = _Size;
}
