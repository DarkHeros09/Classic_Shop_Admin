import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'image_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class ImageApi extends ChopperService {
  static ImageApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ImageApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$ImageApi(client);
  }

  @Get(
    path: '/images-v2',
  )
  Future<Response<List<Map<String, dynamic>>>> getImagesV2({
    @Header('If-None-Match') required String ifNoneMatch,
    @Query('limit') required int pageSize,
  });

  @Get(
    path: '/images-next-page',
  )
  Future<Response<List<Map<String, dynamic>>>> getImagesNextPage({
    @Header('If-None-Match') required String ifNoneMatch,
    @Query('product_cursor') required int lastImageId,
    @Query('limit') required int pageSize,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ImageAdminApi extends ChopperService {
  static ImageAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ImageAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ImageAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/product-images',
  )
  Future<Response<Map<String, dynamic>>> createProductImages({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Get(
    path: '/admins/{adminId}/product-images/kit',
  )
  Future<Response<List<Map<String, dynamic>>>> listProductImagesKit({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path('adminId') required String adminId,
    @Query('path') required String path,
    @Query('tag') required String tag,
  });

  @Put(
    path: '/admins/{adminId}/product-images/{id}',
  )
  Future<Response<Map<String, dynamic>>> updateProductImage({
    @Path() required String adminId,
    @Path() required String id,
    @Body() required Map<String, dynamic> data,
  });
}
