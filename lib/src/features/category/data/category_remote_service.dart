import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/category/data/category_api.dart';
import 'package:classic_shop_admin/src/features/category/data/category_dto.dart';

abstract class ICategoryRemoteService {
  Future<RemoteResponse<List<CategoryDTO?>>> fetchCategories({
    required Uri requestUri,
  });
  Future<RemoteResponse<CategoryDTO>> createCategory({
    required int adminId,
    required int parentCategoryId,
    required String categoryName,
    required String categoryImage,
  });
}

class CategoryRemoteService implements ICategoryRemoteService {
  CategoryRemoteService(
    this._categoryApi,
    this._categoryAdminApi,
    this._headersCache,
  );

  final CategoryApi _categoryApi;
  final CategoryAdminApi _categoryAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<CategoryDTO>>> fetchCategories({
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _categoryApi.getCategories(
        ifNoneMatch: previousHeaders?.etag ?? '',
      );

      if (response.statusCode == 304) {
        return const RemoteResponse.notModified(
          nextAvailable: false,
        );
      }

      if (response.isSuccessful) {
        final headers = ResponseHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, headers);
        final convertedBody = response.body;
        return RemoteResponse.withNewData(
          convertedBody?.map(CategoryDTO.fromJson).toList() ?? [],
          nextAvailable: false,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  @override
  Future<RemoteResponse<CategoryDTO>> createCategory({
    required int adminId,
    required int? parentCategoryId,
    required String categoryName,
    required String categoryImage,
  }) async {
    try {
      final response = await _categoryAdminApi.createCategory(
        adminId: adminId.toString(),
        data: {
          'parent_category_id': parentCategoryId,
          'category_name': categoryName,
          'category_image': categoryImage,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final categoryDTO = CategoryDTO.fromJson(body);

      return RemoteResponse.withNewData(categoryDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
