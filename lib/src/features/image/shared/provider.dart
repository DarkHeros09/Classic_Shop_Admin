import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/image/data/image_api.dart';
import 'package:classic_shop_admin/src/features/image/data/image_local_service.dart';
import 'package:classic_shop_admin/src/features/image/data/image_remote_service.dart';
import 'package:classic_shop_admin/src/features/image/data/image_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
ImageLocalService imageLocalService(ImageLocalServiceRef ref) {
  return ImageLocalService(
    ref.watch(sembastProvider),
  );
}

@Riverpod(keepAlive: true)
ImageApi imageApi(ImageApiRef ref) {
  return ImageApi.create(ref);
}

@Riverpod(keepAlive: true)
ImageRemoteService imageRemoteService(ImageRemoteServiceRef ref) {
  return ImageRemoteService(
    ref.watch(imageApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
ImageRepository imageRepository(ImageRepositoryRef ref) {
  return ImageRepository(
    ref.watch(imageLocalServiceProvider),
    ref.watch(imageRemoteServiceProvider),
  );
}
