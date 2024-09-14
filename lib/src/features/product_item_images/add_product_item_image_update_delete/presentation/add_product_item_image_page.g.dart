// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_item_image_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageUrlHash() => r'b0b9fd904359d8162aa50c4c001763dff73e3cf6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ImageUrl extends BuildlessAutoDisposeNotifier<String?> {
  late final String url;

  String? build(
    String url,
  );
}

/// See also [ImageUrl].
@ProviderFor(ImageUrl)
const imageUrlProvider = ImageUrlFamily();

/// See also [ImageUrl].
class ImageUrlFamily extends Family<String?> {
  /// See also [ImageUrl].
  const ImageUrlFamily();

  /// See also [ImageUrl].
  ImageUrlProvider call(
    String url,
  ) {
    return ImageUrlProvider(
      url,
    );
  }

  @override
  ImageUrlProvider getProviderOverride(
    covariant ImageUrlProvider provider,
  ) {
    return call(
      provider.url,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'imageUrlProvider';
}

/// See also [ImageUrl].
class ImageUrlProvider
    extends AutoDisposeNotifierProviderImpl<ImageUrl, String?> {
  /// See also [ImageUrl].
  ImageUrlProvider(
    String url,
  ) : this._internal(
          () => ImageUrl()..url = url,
          from: imageUrlProvider,
          name: r'imageUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imageUrlHash,
          dependencies: ImageUrlFamily._dependencies,
          allTransitiveDependencies: ImageUrlFamily._allTransitiveDependencies,
          url: url,
        );

  ImageUrlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  String? runNotifierBuild(
    covariant ImageUrl notifier,
  ) {
    return notifier.build(
      url,
    );
  }

  @override
  Override overrideWith(ImageUrl Function() create) {
    return ProviderOverride(
      origin: this,
      override: ImageUrlProvider._internal(
        () => create()..url = url,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ImageUrl, String?> createElement() {
    return _ImageUrlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageUrlProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ImageUrlRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `url` of this provider.
  String get url;
}

class _ImageUrlProviderElement
    extends AutoDisposeNotifierProviderElement<ImageUrl, String?>
    with ImageUrlRef {
  _ImageUrlProviderElement(super.provider);

  @override
  String get url => (origin as ImageUrlProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
