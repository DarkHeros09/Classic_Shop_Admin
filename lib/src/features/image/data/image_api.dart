import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'image_api.chopper.dart';

const normalheaders = {'Content-Type': 'application/json'};

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ImageApi extends ChopperService {
  static ImageApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ImageApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ImageApi(client);
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
    headers: normalheaders,
  )
  Future<Response<List<Map<String, dynamic>>>> listProductImagesKit({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path('adminId') required String adminId,
  });
}
