import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage.freezed.dart';

@freezed
class Manage with _$Manage {
  const factory Manage({
    required int categoryId,
    required String categoryName,
    required int brandId,
    required String brandName,
  }) = _Manage;
  const Manage._();
}
