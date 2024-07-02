import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<Database> db(DbRef ref) {
  return SembastInit().init();
}

@Riverpod(keepAlive: true)
SembastDatabase sembast(SembastRef ref) {
  return SembastDatabase(ref.watch(dbProvider).requireValue);
}

@Riverpod(keepAlive: true)
ResponseHeadersCache responseHeaderCache(ResponseHeaderCacheRef ref) {
  return ResponseHeadersCache(ref.watch(sembastProvider));
}
