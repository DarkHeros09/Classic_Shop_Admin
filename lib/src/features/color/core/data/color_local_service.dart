import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_dto.dart';
import 'package:sembast/sembast.dart';

abstract class IColorLocalService {
  Future<List<ColorDTO>> fetchColor();

  Future<void> setColor(List<ColorDTO> colorsDTO);

  // Future<ColorDTO?> getColor(int colorId);

  // Future<void> updateColor(ColorDTO dto);

  Future<void> deleteColor(int colorId);

  Future<void> deleteAllColors();
}

class ColorLocalService implements IColorLocalService {
  ColorLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('colors');

  // static const colorsKey = 'colors';

  @override
  Future<List<ColorDTO>> fetchColor() async {
    final records = await _store.find(_sembastDatabase.instance);
    return records.map((e) => ColorDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setColor(List<ColorDTO> dto) {
    _store.drop(_sembastDatabase.instance);
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteColor(int colorId) async {
    await _store.record(colorId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllColors() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
