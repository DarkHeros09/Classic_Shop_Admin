import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

@freezed
class Image with _$Image {
  const factory Image({
    required String url,
  }) = _Image;
  const Image._();

  String get cardImagesUrls => '$url?tr=h-224,w-190';
}
