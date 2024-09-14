import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'category_promotion_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class CategoryPromotionAdminApi extends ChopperService {
  static CategoryPromotionAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$CategoryPromotionAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$CategoryPromotionAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/category-promotions',
  )
  Future<Response<Map<String, dynamic>>> createCategoryPromotion({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Put(
    path:
        '/admins/{adminId}/category-promotions/{promotionId}/categories/{categoryId}',
  )
  Future<Response<Map<String, dynamic>>> updateCategoryPromotion({
    @Path() required String adminId,
    @Path() required String promotionId,
    @Path() required String categoryId,
    @Body() required Map<String, dynamic> data,
  });

  @Get(
    path: '/admins/{adminId}/category-promotions',
  )
  Future<Response<List<Map<String, dynamic>>>> getCategoryPromotions({
    @Path() required String adminId,
    @Header('If-None-Match') required String ifNoneMatch,
  });
}
