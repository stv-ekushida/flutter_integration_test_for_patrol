import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pilot_test/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  const nativeConfig =
      NativeAutomatorConfig(bundleId: 'com.example.flutterPilotTest');

  patrolTest('demo',
      nativeAutomatorConfig: nativeConfig,
      framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
      (PatrolIntegrationTester $) async {
    await $.pumpWidgetAndSettle(const MyApp());

    expect(
      find.text('Flutter Demo Home Page'),
      findsOneWidget,
    );

    expect(
      find.text('0'),
      findsOneWidget,
    );

    final button = find.byType(FloatingActionButton);

    expect(
      button,
      findsOneWidget,
    );

    await $.tester.tap(button);

    await $.tester.pumpAndSettle();

    expect(
      find.text('1'),
      findsOneWidget,
    );

    await $.tester.tap(button);

    await $.tester.pumpAndSettle();

    expect(
      find.text('2'),
      findsOneWidget,
    );
  });
}
