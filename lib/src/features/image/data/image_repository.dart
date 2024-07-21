import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/image/data/image_extension.dart';
import 'package:classic_shop_admin/src/features/image/data/image_local_service.dart';
import 'package:classic_shop_admin/src/features/image/data/image_remote_service.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/features/image/domain/image_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ImageRepository {
  ImageRepository(
    this._localService,
    this._remoteService,
  );

  final ImageLocalService _localService;
  final ImageRemoteService _remoteService;

  Future<Either<ImageFailure, Unit>> createImages({
    required int adminId,
    required String productImage1,
    required String productImage2,
    required String productImage3,
  }) async {
    try {
      final category = await _remoteService.createImages(
        adminId: adminId,
        productImage1: productImage1,
        productImage2: productImage2,
        productImage3: productImage3,
      );

      return await category.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const ImageFailure.server('Could not create images')),
      );
    } on RestApiException catch (e) {
      return left(ImageFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const ImageFailure.server('Could not create images'));
    }
  }

  Future<Either<ImageFailure, Fresh<List<Image>>>> fetchImages({
    required int adminId,
  }) async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/admin/v1/admins/$adminId/product-images/kit',
      );
      final images = await _remoteService.fetchImages(
        adminId: adminId,
        requestUri: requestUri,
      );

      return right(
        await images.when(
          noConnection: () async => Fresh.no(
            await _localService.fetchImage().then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllImages();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService.fetchImage().then((_) => _.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setImage(data);
            debugPrint('IIMMGG $data');
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(ImageFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }
}
