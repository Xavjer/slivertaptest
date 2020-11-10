// Imports the Flutter Driver API.
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  //Declare top Screens
  final testScreen = find.byType('MyApp');

  group('slivertaptest', ()
  {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });


    //Login
    group('Test', () {
      test('Load first screen', () async {
        await Future.delayed(Duration(seconds:3));
        await driver.waitFor(testScreen, timeout: Duration(seconds:15));
      });
      test('Tap SliverToBoxAdapter', () async {
        await driver.tap(find.byType('SliverToBoxAdapter'));
      });
      test('Tap SliverFixedExtentList', () async {
        await driver.tap(find.byType('SliverFixedExtentList'));
      });
      test('Tap SliverChildListDelegate', () async {
        await driver.tap(find.byType('SliverChildListDelegate'));
      });
      test('Tap Container', () async {
        await driver.tap(find.byValueKey('thecontainer'));
      });
      test('Tap GestureDetector', () async {
        await driver.tap(find.byValueKey('gesturedetector'));
      });
    });
  });
}