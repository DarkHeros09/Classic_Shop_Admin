import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'previous_path_notifier.g.dart';

@riverpod
class PreviousPathNotifier extends _$PreviousPathNotifier {
  @override
  String? build() {
    return null;
  }

  void setPath(String? path) {
    state = path;
  }
}
