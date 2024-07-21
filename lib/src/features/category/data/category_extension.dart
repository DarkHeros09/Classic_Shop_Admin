import 'package:classic_shop_admin/src/features/category/data/category_dto.dart';
import 'package:classic_shop_admin/src/features/category/domain/category.dart';

extension DTOListToDomainList on List<CategoryDTO> {
  List<Category> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
