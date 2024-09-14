import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_dto.freezed.dart';
part 'api_error_dto.g.dart';

@freezed
class ApiErrorDTO with _$ApiErrorDTO {
  const factory ApiErrorDTO({
    required String error,
  }) = _ApiErrorDTO;
  const ApiErrorDTO._();
  factory ApiErrorDTO.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDTOFromJson(json);
}
