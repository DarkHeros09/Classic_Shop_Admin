import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_dto.dart';
import 'package:sembast/sembast.dart';

abstract class ISizeLocalService {
  Future<List<SizeDTO>> fetchSize();

  Future<void> setSize(List<SizeDTO> sizesDTO);

  // Future<SizeDTO?> getSize(int sizeId);

  // Future<void> updateSize(SizeDTO dto);

  Future<void> deleteSize(int sizeId);

  Future<void> deleteAllSizes();
}

class SizeLocalService implements ISizeLocalService {
  SizeLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('sizes');

  // static const sizesKey = 'sizes';

  @override
  Future<List<SizeDTO>> fetchSize() async {
    final records = await _store.find(_sembastDatabase.instance);
    return records.map((e) => SizeDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setSize(List<SizeDTO> dto) {
    _store.drop(_sembastDatabase.instance);
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteSize(int sizeId) async {
    await _store.record(sizeId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllSizes() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
