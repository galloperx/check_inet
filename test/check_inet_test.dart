import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:check_inet/check_inet.dart';

void main() {
  const MethodChannel channel = MethodChannel('check_inet');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await CheckInet.platformVersion, '42');
  });
}
