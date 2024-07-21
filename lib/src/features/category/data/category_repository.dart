import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/category/data/category_extension.dart';
import 'package:classic_shop_admin/src/features/category/data/category_local_service.dart';
import 'package:classic_shop_admin/src/features/category/data/category_remote_service.dart';
import 'package:classic_shop_admin/src/features/category/domain/category.dart';
import 'package:classic_shop_admin/src/features/category/domain/category_failure.dart';
import 'package:dartz/dartz.dart';

class CategoryRepository {
  CategoryRepository(
    this._localService,
    this._remoteService,
  );

  final CategoryLocalService _localService;
  final CategoryRemoteService _remoteService;

  Future<Either<CategoryFailure, Fresh<List<Category>>>> fetchCategory() async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/categories',
      );
      final category = await _remoteService.fetchCategories(
        requestUri: requestUri,
      );

      return right(
        await category.when(
          noConnection: () async => Fresh.no(
            await _localService.fetchCategory().then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllCategories();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService.fetchCategory().then((_) => _.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setCategory(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(CategoryFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<CategoryFailure, Unit>> createCategory({
    required int adminId,
    required int? parentCategoryId,
    required String categoryName,
    required String categoryImage,
  }) async {
    try {
      final category = await _remoteService.createCategory(
        adminId: adminId,
        parentCategoryId: parentCategoryId,
        categoryName: categoryName,
        categoryImage: categoryImage,
      );

      return await category.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const CategoryFailure.server('Could not create category')),
      );
    } on RestApiException catch (e) {
      return left(CategoryFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const CategoryFailure.server('Could not create category'));
    }
  }
}
