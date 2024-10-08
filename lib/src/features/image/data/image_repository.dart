import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/image/data/image_dto.dart';
import 'package:classic_shop_admin/src/features/image/data/image_extension.dart';
import 'package:classic_shop_admin/src/features/image/data/image_local_service.dart';
import 'package:classic_shop_admin/src/features/image/data/image_remote_service.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/features/image/domain/image_failure.dart';
import 'package:classic_shop_admin/src/features/image/helpers/enums.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ImageRepository {
  ImageRepository(
    this._localService,
    this._remoteService,
    this._headersCache,
  );

  final ImageLocalService _localService;
  final ImageRemoteService _remoteService;
  final ResponseHeadersCache _headersCache;

  Map<String, String> _createQueryParams({
    int? lastImageId,
    String? query,
    int? pageSize,
  }) {
    final pageSizeString = pageSize == null
        ? PaginationConfig.itemsPerPage.toString()
        : pageSize.toString();
    final queryParams = {
      'limit': pageSizeString,
    };
    if (lastImageId != null) {
      queryParams['last_image_id'] = lastImageId.toString();
    }
    if (query != null) {
      queryParams['query'] = query;
    }
    return queryParams;
  }

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

  Future<Either<ImageFailure, Fresh<List<ImageKit>>>> fetchImageKits({
    required int adminId,
    required String path,
    String? tag,
  }) async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/admin/v1/admins/$adminId/product-images/kit',
      );
      final images = await _remoteService.fetchImageKits(
        adminId: adminId,
        requestUri: requestUri,
        path: path,
        tag: tag,
      );

      return right(
        await images.when(
          noConnection: (nextAvailable) async => Fresh.no(
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

  Future<Either<ImageFailure, Fresh<List<ProductImage>>>> getImages(
    int page, {
    required ImagesFunction imagesFunction,
    int? lastImageId,
    String? query,
    int? pageSize,
  }) async {
    try {
      late final RemoteResponse<List<ProductItemImageDTO>> remotePageImages;
      late final Uri requestUri;
      final queryParams = _createQueryParams(
        lastImageId: lastImageId,
        pageSize: pageSize,
      );
      switch (imagesFunction) {
        case ImagesFunction.getImages:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/images-V2',
            queryParams,
          );
          remotePageImages = await _remoteService.fetchImages(
            imagesFunction: imagesFunction,
            requestUri: requestUri,
            pageSize: pageSize,
          );

        case ImagesFunction.getImagesNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/images-next-page',
            queryParams,
          );
          remotePageImages = await _remoteService.fetchImages(
            imagesFunction: imagesFunction,
            requestUri: requestUri,
            lastImageId: lastImageId,
            pageSize: pageSize,
          );
      }
      return await _rightRemotePageImages(
        remotePageImages,
        page,
        requestUri,
      );
    } on RestApiException catch (e) {
      return left(ImageFailure.api(e.errorCode));
    }
  }

  Future<Either<ImageFailure, Fresh<List<ProductImage>>>>
      _rightRemotePageImages(
    RemoteResponse<List<ProductItemImageDTO>> remotePageImages,
    int page,
    Uri requestUri,
  ) async {
    return right(
      await remotePageImages.when(
        noConnection: (nextAvailable) async => Fresh.no(
          await _localService
              .getPage(page, requestUri.toString())
              .then((_) => _.toDomain()),
          isNextPageAvailable: page <
              await _localService.getLocalPageCount(requestUri.toString()),
        ),
        noContent: () async {
          await _localService.deleteByUri(requestUri.toString());
          return Fresh.no([], isNextPageAvailable: false);
        },
        notModified: (nextAvailable) async {
          final localData = await _localService
              .getPage(page, requestUri.toString())
              .then((_) => _.toDomain());

          if (localData.isEmpty) {
            await _headersCache.deleteHeaders(requestUri);
          }
          return Fresh.yes(
            localData,
            isNextPageAvailable: nextAvailable,
          );
        },
        withNewData: (data, nextAvailable) async {
          // await _localService.deletePage(page);
          await _localService.upsertPage(data, page, requestUri.toString());
          return Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: nextAvailable,
          );
        },
      ),
    );
  }

  Future<Either<ImageFailure, Unit>> updateProductImage({
    required int adminId,
    required int productItemImageId,
    String? productImage1,
    String? productImage2,
    String? productImage3,
  }) async {
    try {
      final productImage = await _remoteService.updateProductItemImage(
        adminId: adminId,
        productItemImageId: productItemImageId,
        productImage1: productImage1,
        productImage2: productImage2,
        productImage3: productImage3,
      );

      return await productImage.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const ImageFailure.server('Could not create product')),
      );
    } on RestApiException catch (e) {
      return left(ImageFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const ImageFailure.server('Could not create product'));
    }
  }
}
