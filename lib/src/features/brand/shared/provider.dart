import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_api.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_local_service.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_remote_service.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
BrandLocalService brandLocalService(BrandLocalServiceRef ref) {
  return BrandLocalService(
    ref.watch(sembastProvider),
  );
}

@Riverpod(keepAlive: true)
BrandApi brandApi(BrandApiRef ref) {
  return BrandApi.create();
}

@Riverpod(keepAlive: true)
BrandAdminApi brandAdminApi(BrandAdminApiRef ref) {
  return BrandAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
BrandRemoteService brandRemoteService(BrandRemoteServiceRef ref) {
  return BrandRemoteService(
    ref.watch(brandApiProvider),
    ref.watch(brandAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
BrandRepository brandRepository(BrandRepositoryRef ref) {
  return BrandRepository(
    ref.watch(brandLocalServiceProvider),
    ref.watch(brandRemoteServiceProvider),
  );
}
