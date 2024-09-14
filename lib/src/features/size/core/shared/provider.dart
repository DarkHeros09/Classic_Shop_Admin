import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_api.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_local_service.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_remote_service.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
SizeLocalService sizeLocalService(SizeLocalServiceRef ref) {
  return SizeLocalService(
    ref.watch(sembastProvider),
  );
}

@Riverpod(keepAlive: true)
SizeApi sizeApi(SizeApiRef ref) {
  return SizeApi.create();
}

@Riverpod(keepAlive: true)
SizeAdminApi sizeAdminApi(SizeAdminApiRef ref) {
  return SizeAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
SizeRemoteService sizeRemoteService(SizeRemoteServiceRef ref) {
  return SizeRemoteService(
    ref.watch(sizeApiProvider),
    ref.watch(sizeAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
SizeRepository sizeRepository(SizeRepositoryRef ref) {
  return SizeRepository(
    ref.watch(sizeLocalServiceProvider),
    ref.watch(sizeRemoteServiceProvider),
  );
}
