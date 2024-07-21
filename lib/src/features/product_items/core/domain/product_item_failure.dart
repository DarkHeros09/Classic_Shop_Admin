import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_item_failure.freezed.dart';

@freezed
class ProductItemFailure with _$ProductItemFailure {
  const ProductItemFailure._();
  const factory ProductItemFailure.api(int? errorCode) = _Api;
}
