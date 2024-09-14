import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IBrandLocalService {
  Future<List<BrandDTO>> fetchBrands();

  Future<void> setBrands(List<BrandDTO> brandsDTO);

  // Future<BrandDTO?> getBrand(int brandId);

  // Future<void> updateBrand(BrandDTO dto);

  Future<BrandDTO> setBrand(BrandDTO dto);
  Future<BrandDTO?> getBrand(int brandId);

  Future<void> deleteBrand(int brandId);

  Future<void> deleteAllBrands();
}

class BrandLocalService implements IBrandLocalService {
  BrandLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('brands');

  // static const brandsKey = 'brands';

  @override
  Future<List<BrandDTO>> fetchBrands() async {
    final records = await _store.find(_sembastDatabase.instance);
    return records.map((e) => BrandDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setBrands(List<BrandDTO> dto) {
    _store.drop(_sembastDatabase.instance);
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteBrand(int brandId) async {
    await _store.record(brandId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllBrands() async {
    await _store.drop(_sembastDatabase.instance);
  }

  @override
  Future<BrandDTO> setBrand(BrandDTO dto) async {
    final store = intMapStoreFactory.store('brand_id : ${dto.id}');
    final saved = await store.record(dto.id).put(
          _sembastDatabase.instance,
          dto.toJson(),
        );
    debugPrint('resultCAT:SAVE $saved');
    return dto;
  }

  @override
  Future<BrandDTO?> getBrand(int brandId) async {
    final store = intMapStoreFactory.store('brand_id : $brandId');
    final record = await store.record(brandId).get(_sembastDatabase.instance);

    if (record != null) {
      return BrandDTO.fromJson(record);
    }
    return null;
  }
}
