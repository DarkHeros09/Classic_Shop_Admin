/// Generated file. Do not edit.
///
/// To regenerate, run: `dart run enven`
class Env {
  /// Override this instance to mock the environment.
  /// Example: `Env.instance = MockEnvData();`
  static EnvData instance = EnvData();

  static String get dotenvPublicKey => instance.dotenvPublicKey;
  static const String httpAddress = '192.168.1.105:8080';
  static const String onesignalAppId = '978fbbf3-de24-4909-94b9-f1b8b09bc326';
}

class EnvData {
  final String dotenvPublicKey = '026e7cafe4b0491d1839f8523c33deb37439b75af4bc9f24b946b3ef5d88e74005';
}
