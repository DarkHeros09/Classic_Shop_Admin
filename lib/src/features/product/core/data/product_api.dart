import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'product_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class ProductApi extends ChopperService {
  static ProductApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ProductApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$ProductApi(client);
  }

  @Get(
    path: '/products',
  )
  Future<Response<List<Map<String, dynamic>>>> getProducts({
    @Header('If-None-Match') required String ifNoneMatch,
  });

  @Get(
    path: '/products-v2',
  )
  Future<Response<List<Map<String, dynamic>>>> getProductsV2({
    @Header('If-None-Match') required String ifNoneMatch,
    @Query('limit') required int pageSize,
  });

  @Get(
    path: '/products-next-page',
  )
  Future<Response<List<Map<String, dynamic>>>> getProductsNextPage({
    @Header('If-None-Match') required String ifNoneMatch,
    @Query('product_cursor') required int lastProductId,
    @Query('limit') required int pageSize,
  });

  @Get(
    path: '/search-products',
  )
  Future<Response<List<Map<String, dynamic>>>> searchProducts({
    @Query() required String query,
    @Query('limit') required int pageSize,
  });

  @Get(
    path: '/search-products-next-page',
  )
  Future<Response<List<Map<String, dynamic>>>> searchProductsNextPage({
    @Query() required String query,
    @Query('product_cursor') required int lastProductId,
    @Query('limit') required int pageSize,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ProductAdminApi extends ChopperService {
  static ProductAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ProductAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ProductAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/products',
  )
  Future<Response<Map<String, dynamic>>> createProduct({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Put(
    path: '/admins/{adminId}/products/{productId}',
  )
  Future<Response<Map<String, dynamic>>> updateProduct({
    @Path() required String adminId,
    @Path() required String productId,
    @Body() required Map<String, dynamic> data,
  });

  @Delete(
    path: '/admins/{adminId}/products/{productId}',
  )
  Future<Response<Map<String, dynamic>>> deleteProduct({
    @Path() required String adminId,
    @Path() required String productId,
  });
}
