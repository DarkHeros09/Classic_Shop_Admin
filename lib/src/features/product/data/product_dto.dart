import 'package:classic_shop_admin/src/features/product/domain/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    required int id,
    required String name,
    required String description,
    required int categoryId,
    required int brandId,
    required bool active,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool nextAvailable,
  }) = _ProductDTO;
  const ProductDTO._();
  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  factory ProductDTO.fromDomain(Product _) {
    return ProductDTO(
      id: _.id,
      name: _.name,
      description: _.description,
      categoryId: _.categoryId,
      brandId: _.brandId,
      active: _.active,
      createdAt: _.createdAt,
      updatedAt: _.updatedAt,
      nextAvailable: _.nextAvailable,
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      description: description,
      categoryId: categoryId,
      brandId: brandId,
      active: active,
      createdAt: createdAt,
      updatedAt: updatedAt,
      nextAvailable: nextAvailable,
    );
  }
}
