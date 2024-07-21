import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_failure.freezed.dart';

@freezed
class ImageFailure with _$ImageFailure {
  const ImageFailure._();
  const factory ImageFailure.api(int? errorCode) = _Api;
  const factory ImageFailure.server(String? message) = _Server;
  // const factory ImageFailure.storage() = _Storage;
}
