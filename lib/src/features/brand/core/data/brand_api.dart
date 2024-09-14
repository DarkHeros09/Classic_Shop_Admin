import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/io_client.dart';

part 'brand_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class BrandApi extends ChopperService {
  static BrandApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$BrandApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$BrandApi(client);
  }

  @Get(
    path: '/brands',
  )
  Future<Response<List<Map<String, dynamic>>>> getBrands({
    @Header('If-None-Match') required String ifNoneMatch,
  });

  @Get(
    path: '/brands/{brandId}',
  )
  Future<Response<Map<String, dynamic>>> getBrand({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path() required String brandId,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class BrandAdminApi extends ChopperService {
  static BrandAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$BrandAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$BrandAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/brands',
  )
  Future<Response<Map<String, dynamic>>> createBrand({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Put(
    path: '/admins/{adminId}/brands/{brandId}',
  )
  Future<Response<Map<String, dynamic>>> updateBrand({
    @Path() required String adminId,
    @Path() required String brandId,
    @Body() required Map<String, dynamic> data,
  });
}
