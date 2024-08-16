import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/color/data/color_local_service.dart';
import 'package:classic_shop_admin/src/features/color/data/color_remote_service.dart';
import 'package:classic_shop_admin/src/features/color/data/size_extension.dart';
import 'package:classic_shop_admin/src/features/color/domain/color.dart';
import 'package:classic_shop_admin/src/features/color/domain/color_failure.dart';
import 'package:dartz/dartz.dart';

class ColorRepository {
  ColorRepository(
    this._localService,
    this._remoteService,
  );

  final ColorLocalService _localService;
  final ColorRemoteService _remoteService;

  Future<Either<ColorFailure, Fresh<List<Color>>>> fetchColors() async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/colors',
      );
      final category = await _remoteService.fetchColors(
        requestUri: requestUri,
      );

      return right(
        await category.when(
          noConnection: () async => Fresh.no(
            await _localService.fetchColor().then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllColors();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService.fetchColor().then((_) => _.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setColor(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(ColorFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<ColorFailure, Unit>> createColor({
    required int adminId,
    required String colorValue,
  }) async {
    try {
      final category = await _remoteService.createColor(
        adminId: adminId,
        colorValue: colorValue,
      );

      return await category.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(const ColorFailure.server('Could not create color')),
      );
    } on RestApiException catch (e) {
      return left(ColorFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const ColorFailure.server('Could not create color'));
    }
  }
}
