import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String description,
    required int categoryId,
    required int brandId,
    required bool active,
    required DateTime createdAt,
    required DateTime updatedAt,
    // required bool nextAvailable,
  }) = _Product;
  const Product._();
}
