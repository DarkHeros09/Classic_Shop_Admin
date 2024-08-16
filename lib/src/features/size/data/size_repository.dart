import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/size/data/size_extension.dart';
import 'package:classic_shop_admin/src/features/size/data/size_local_service.dart';
import 'package:classic_shop_admin/src/features/size/data/size_remote_service.dart';
import 'package:classic_shop_admin/src/features/size/domain/size.dart';
import 'package:classic_shop_admin/src/features/size/domain/size_failure.dart';
import 'package:dartz/dartz.dart';

class SizeRepository {
  SizeRepository(
    this._localService,
    this._remoteService,
  );

  final SizeLocalService _localService;
  final SizeRemoteService _remoteService;

  Future<Either<SizeFailure, Fresh<List<Size>>>> fetchSizes() async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/sizes',
      );
      final sizes = await _remoteService.fetchSizes(
        requestUri: requestUri,
      );

      return right(
        await sizes.when(
          noConnection: () async => Fresh.no(
            await _localService.fetchSize().then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllSizes();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService.fetchSize().then((_) => _.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setSize(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(SizeFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<SizeFailure, Unit>> createSize({
    required int adminId,
    required String sizeValue,
  }) async {
    try {
      final sizes = await _remoteService.createSize(
        adminId: adminId,
        sizeValue: sizeValue,
      );

      return await sizes.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(const SizeFailure.server('Could not create size')),
      );
    } on RestApiException catch (e) {
      return left(SizeFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const SizeFailure.server('Could not create size'));
    }
  }
}
