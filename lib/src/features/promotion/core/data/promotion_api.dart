import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'promotion_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class PromotionApi extends ChopperService {
  static PromotionApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$PromotionApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$PromotionApi(client);
  }

  @Get(
    path: '/promotions',
  )
  Future<Response<List<Map<String, dynamic>>>> getPromotions({
    @Header('If-None-Match') required String ifNoneMatch,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class PromotionAdminApi extends ChopperService {
  static PromotionAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$PromotionAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$PromotionAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/promotions',
  )
  Future<Response<Map<String, dynamic>>> createPromotion({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Put(
    path: '/admins/{adminId}/promotions/{promotionId}',
  )
  Future<Response<Map<String, dynamic>>> updatePromotion({
    @Path() required String adminId,
    @Path() required String promotionId,
    @Body() required Map<String, dynamic> data,
  });
}
