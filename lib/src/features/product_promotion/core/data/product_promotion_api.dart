import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'product_promotion_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class ProductPromotionApi extends ChopperService {
  static ProductPromotionApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ProductPromotionApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$ProductPromotionApi(client);
  }

  @Get(
    path: '/product-promotions',
  )
  Future<Response<List<Map<String, dynamic>>>> getProductPromotions({
    @Header('If-None-Match') required String ifNoneMatch,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ProductPromotionAdminApi extends ChopperService {
  static ProductPromotionAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ProductPromotionAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ProductPromotionAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/product-promotions',
  )
  Future<Response<Map<String, dynamic>>> createProductPromotion({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Put(
    path:
        '/admins/{adminId}/product-promotions/{promotionId}/products/{productId}',
  )
  Future<Response<Map<String, dynamic>>> updateProductPromotion({
    @Path() required String adminId,
    @Path() required String promotionId,
    @Path() required String productId,
    @Body() required Map<String, dynamic> data,
  });

  @Get(
    path: '/admins/{adminId}/product-promotions',
  )
  Future<Response<List<Map<String, dynamic>>>> getProductPromotions({
    @Path() required String adminId,
    @Header('If-None-Match') required String ifNoneMatch,
  });
}
