import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_extension.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_local_service.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_remote_service.dart';
import 'package:classic_shop_admin/src/features/brand/core/domain/brand.dart';
import 'package:classic_shop_admin/src/features/brand/core/domain/brand_failure.dart';
import 'package:dartz/dartz.dart';

class BrandRepository {
  BrandRepository(
    this._localService,
    this._remoteService,
  );

  final BrandLocalService _localService;
  final BrandRemoteService _remoteService;

  Future<Either<BrandFailure, Fresh<List<Brand>>>> fetchBrands() async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/brands',
      );
      final brand = await _remoteService.fetchBrands(
        requestUri: requestUri,
      );

      return right(
        await brand.when(
          noConnection: () async => Fresh.no(
            await _localService.fetchBrands().then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllBrands();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService.fetchBrands().then((_) => _.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setBrands(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(BrandFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<BrandFailure, Unit>> createBrand({
    required int adminId,
    required String brandName,
    required String brandImage,
  }) async {
    try {
      final brand = await _remoteService.createBrand(
        adminId: adminId,
        brandName: brandName,
        brandImage: brandImage,
      );

      return await brand.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(const BrandFailure.server('Could not create brand')),
      );
    } on RestApiException catch (e) {
      return left(BrandFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const BrandFailure.server('Could not create brand'));
    }
  }

  Future<Either<BrandFailure, Fresh<Brand?>>> fetchBrandById({
    required int brandId,
  }) async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/brands/$brandId',
      );
      final brand = await _remoteService.fetchBrand(
        requestUri: requestUri,
        brandId: brandId.toString(),
      );

      return right(
        await brand.when(
          noConnection: () async => Fresh.no(
            await _localService.getBrand(brandId).then((_) => _!.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllBrands();
            return Fresh.no(null, isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService.getBrand(brandId).then((_) => _!.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setBrand(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(BrandFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<BrandFailure, Unit>> updateBrand({
    required int adminId,
    required int brandId,
    String? brandName,
    String? brandImage,
  }) async {
    try {
      final brand = await _remoteService.updateBrand(
        adminId: adminId,
        brandId: brandId,
        brandName: brandName,
        brandImage: brandImage,
      );

      return await brand.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(const BrandFailure.server('Could not create brand')),
      );
    } on RestApiException catch (e) {
      return left(BrandFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const BrandFailure.server('Could not create brand'));
    }
  }
}
