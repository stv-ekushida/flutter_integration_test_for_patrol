import 'package:flutter_driver/flutter_driver.dart';
import 'dart:developer' as developer;
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final FlutterDriver driver = await FlutterDriver.connect();

  try {
    await integrationDriver(
      driver: driver,
    );
  } catch (e) {
    developer.log(e.toString());
  }
}
