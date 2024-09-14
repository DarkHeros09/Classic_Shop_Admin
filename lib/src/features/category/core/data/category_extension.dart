import 'package:classic_shop_admin/src/features/category/core/data/category_dto.dart';
import 'package:classic_shop_admin/src/features/category/core/domain/category.dart';

extension DTOListToDomainList on List<CategoryDTO> {
  List<Category> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
