import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_api.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_local_service.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_remote_service.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
ProductLocalService productLocalService(ProductLocalServiceRef ref) {
  return ProductLocalService(
    ref.watch(sembastProvider),
  );
}

@Riverpod(keepAlive: true)
ProductApi productApi(ProductApiRef ref) {
  return ProductApi.create();
}

@Riverpod(keepAlive: true)
ProductAdminApi productAdminApi(ProductAdminApiRef ref) {
  return ProductAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
ProductRemoteService productRemoteService(ProductRemoteServiceRef ref) {
  return ProductRemoteService(
    ref.watch(productApiProvider),
    ref.watch(productAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository(
    ref.watch(productLocalServiceProvider),
    ref.watch(productRemoteServiceProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}
