import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/category/core/data/category_api.dart';
import 'package:classic_shop_admin/src/features/category/core/data/category_dto.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class ICategoryRemoteService {
  Future<RemoteResponse<List<CategoryDTO?>>> fetchCategories({
    required Uri requestUri,
  });
  Future<RemoteResponse<CategoryDTO?>> fetchCategory({
    required Uri requestUri,
    required String categoryId,
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

  @override
  Future<RemoteResponse<CategoryDTO>> fetchCategory({
    required Uri requestUri,
    required String categoryId,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<Map<String, dynamic>> response;

      response = await _categoryApi.getCategory(
        ifNoneMatch: previousHeaders?.etag ?? '',
        categoryId: categoryId,
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
          CategoryDTO.fromJson(convertedBody ?? {}),
          nextAvailable: false,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Map<String, dynamic> _createBodyRequest({
    String? categoryName,
    String? categoryImage,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (categoryName != null) {
      bodyRequest['category_name'] = categoryName;
    }
    if (categoryImage != null) {
      bodyRequest['category_image'] = categoryImage;
    }

    return bodyRequest;
  }

  Future<RemoteResponse<CategoryDTO>> updateCategory({
    required int adminId,
    required int categoryId,
    String? categoryName,
    String? categoryImage,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        categoryName: categoryName,
        categoryImage: categoryImage,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _categoryAdminApi.updateCategory(
        adminId: adminId.toString(),
        categoryId: categoryId.toString(),
        data: bodyRequest,
      );

      debugPrint('JKL ${response.bodyString}');

      if (!response.isSuccessful) {
        final errorMessage = ApiErrorDTO.fromJson(response.body ?? {});
        throw RestApiException(response.statusCode, errorMessage.error);
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
