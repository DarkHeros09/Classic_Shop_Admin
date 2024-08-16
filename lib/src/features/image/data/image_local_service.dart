import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/image/data/image_dto.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IImageLocalService {
  Future<List<ImageKitDTO>> fetchImage();

  Future<void> setImage(List<ImageKitDTO> imagesDTO);

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

  @override
  Future<void> deleteImage(int brandId) async {
    await _store.record(brandId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllImages() async {
    await _store.drop(_sembastDatabase.instance);
  }

  // ProductImages

  Future<void> upsertPage(
    List<ProductImageDTO> dtos,
    int page,
    String uri,
  ) async {
    final store = intMapStoreFactory.store(uri);
    final sembastPage = page - 1;

    await store
        .records(
          dtos.mapIndexed(
            (index, _) => index + PaginationConfig.itemsPerPage * sembastPage,
          ),
        )
        .put(
          _sembastDatabase.instance,
          dtos.map((e) => e.toJson()).toList(),
        );
  }

  Future<List<ProductImageDTO>> getPage(int page, String uri) async {
    debugPrint('ZXZX $uri');
    final store = intMapStoreFactory.store(uri);
    // final sembastPage = page - 1;

    final records = await store.find(
      _sembastDatabase.instance,
      // finder: Finder(
      //   limit: PaginationConfig.itemsPerPage,
      //   offset: PaginationConfig.itemsPerPage * sembastPage,
      // ),
    );

    return records.map((e) => ProductImageDTO.fromJson(e.value)).toList();
  }

  Future<int> getLocalPageCount(String uri) async {
    final store = intMapStoreFactory.store(uri);
    final productsCount = await store.count(_sembastDatabase.instance);
    return (productsCount / PaginationConfig.itemsPerPage).ceil();
  }

  Future<void> deletePage(int page, String uri) async {
    final store = intMapStoreFactory.store(uri);
    final sembastPage = page - 1;
    await store.delete(
      _sembastDatabase.instance,
      finder: Finder(
        limit: PaginationConfig.itemsPerPage,
        offset: PaginationConfig.itemsPerPage * sembastPage,
      ),
    );
  }

  Future<void> deleteByUri(String uri) async {
    debugPrint('ZXZX DELETE CALLED');
    final store = intMapStoreFactory.store(uri);
    // final sembastPage = page - 1;
    await store.delete(
      _sembastDatabase.instance,
      // finder: Finder(
      //   limit: PaginationConfig.itemsPerPage,
      //   offset: PaginationConfig.itemsPerPage * sembastPage,
      // ),
    );
  }

  Future<void> deleteAllProducts(String uri) async {
    final store = intMapStoreFactory.store(uri);
    await store.drop(_sembastDatabase.instance);
  }
}
