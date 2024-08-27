// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_promotion_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$BrandPromotionAdminApi extends BrandPromotionAdminApi {
  _$BrandPromotionAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = BrandPromotionAdminApi;

  @override
  Future<Response<Map<String, dynamic>>> createBrandPromotion({
    required String adminId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/brand-promotions');
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
