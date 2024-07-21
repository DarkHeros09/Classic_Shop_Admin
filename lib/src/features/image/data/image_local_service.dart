import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/image/data/image_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IImageLocalService {
  Future<List<ImageKitDTO>> fetchImage();

  Future<void> setImage(List<ImageKitDTO> imagesDTO);

  // Future<ImageKitDTO?> getImage(int brandId);

  // Future<void> updateImage(ImageKitDTO dto);

  Future<void> deleteImage(int brandId);

  Future<void> deleteAllImages();
}

class ImageLocalService implements IImageLocalService {
  ImageLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('images');

  // static const imagesKey = 'images';

  @override
  Future<List<ImageKitDTO>> fetchImage() async {
    final records = await _store.find(_sembastDatabase.instance);
    debugPrint('IIMMGG local called $records');
    return records.map((e) => ImageKitDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setImage(List<ImageKitDTO> dto) {
    _store.drop(_sembastDatabase.instance);
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  // @override
  // Future<ImageKitDTO?> getImage(int brandId) async {
  //   final record =
  //       await _store.record(brandId).get(_sembastDatabase.instance);

  //   if (record != null) {
  //     return ImageKitDTO.fromJson(record);
  //   }
  //   return null;
  // }

  // @override
  // Future<void> updateImage(ImageKitDTO dto) async {
  //   await _store.record(dto.id).update(_sembastDatabase.instance, dto.toJson());
  // }

  @override
  Future<void> deleteImage(int brandId) async {
    await _store.record(brandId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllImages() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
