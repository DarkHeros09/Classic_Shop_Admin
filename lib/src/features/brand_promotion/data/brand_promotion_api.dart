import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'brand_promotion_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class BrandPromotionAdminApi extends ChopperService {
  static BrandPromotionAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$BrandPromotionAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$BrandPromotionAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/brand-promotions',
  )
  Future<Response<Map<String, dynamic>>> createBrandPromotion({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });
}
