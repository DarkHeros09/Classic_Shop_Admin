import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_api.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_local_service.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_remote_service.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
ColorLocalService colorLocalService(ColorLocalServiceRef ref) {
  return ColorLocalService(
    ref.watch(sembastProvider),
  );
}

@Riverpod(keepAlive: true)
ColorApi colorApi(ColorApiRef ref) {
  return ColorApi.create();
}

@Riverpod(keepAlive: true)
ColorAdminApi colorAdminApi(ColorAdminApiRef ref) {
  return ColorAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
ColorRemoteService colorRemoteService(ColorRemoteServiceRef ref) {
  return ColorRemoteService(
    ref.watch(colorApiProvider),
    ref.watch(colorAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
ColorRepository colorRepository(ColorRepositoryRef ref) {
  return ColorRepository(
    ref.watch(colorLocalServiceProvider),
    ref.watch(colorRemoteServiceProvider),
  );
}
