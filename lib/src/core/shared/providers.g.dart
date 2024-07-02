// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbHash() => r'4e57fd4c2c1a36d7b667a439778497262819ed1d';

/// See also [db].
@ProviderFor(db)
final dbProvider = FutureProvider<Database>.internal(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DbRef = FutureProviderRef<Database>;
String _$sembastHash() => r'2a5dbfa1e8bdd458a4d8e308b41edd66c452d4b4';

/// See also [sembast].
@ProviderFor(sembast)
final sembastProvider = Provider<SembastDatabase>.internal(
  sembast,
  name: r'sembastProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sembastHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SembastRef = ProviderRef<SembastDatabase>;
String _$responseHeaderCacheHash() =>
    r'dab5c7ab74e79a21283ab267dd51ed064c970eb7';

/// See also [responseHeaderCache].
@ProviderFor(responseHeaderCache)
final responseHeaderCacheProvider = Provider<ResponseHeadersCache>.internal(
  responseHeaderCache,
  name: r'responseHeaderCacheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$responseHeaderCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ResponseHeaderCacheRef = ProviderRef<ResponseHeadersCache>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
