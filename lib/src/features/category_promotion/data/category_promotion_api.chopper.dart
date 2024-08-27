// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_promotion_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CategoryPromotionAdminApi extends CategoryPromotionAdminApi {
  _$CategoryPromotionAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CategoryPromotionAdminApi;

  @override
  Future<Response<Map<String, dynamic>>> createCategoryPromotion({
    required String adminId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/category-promotions');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
