import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/category/data/category_api.dart';
import 'package:classic_shop_admin/src/features/category/data/category_local_service.dart';
import 'package:classic_shop_admin/src/features/category/data/category_remote_service.dart';
import 'package:classic_shop_admin/src/features/category/data/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
CategoryLocalService categoryLocalService(CategoryLocalServiceRef ref) {
  return CategoryLocalService(
    ref.watch(sembastProvider),
  );
}

@Riverpod(keepAlive: true)
CategoryApi categoryApi(CategoryApiRef ref) {
  return CategoryApi.create();
}

@Riverpod(keepAlive: true)
CategoryAdminApi categoryAdminApi(CategoryAdminApiRef ref) {
  return CategoryAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
CategoryRemoteService categoryRemoteService(CategoryRemoteServiceRef ref) {
  return CategoryRemoteService(
    ref.watch(categoryApiProvider),
    ref.watch(categoryAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepository(
    ref.watch(categoryLocalServiceProvider),
    ref.watch(categoryRemoteServiceProvider),
  );
}
