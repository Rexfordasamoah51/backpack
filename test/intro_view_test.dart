import 'package:backpack/src/ui/presentation/starter/starter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Looking up for the intro screen', (tester) async {
    const testKey = Key('starter');

    await tester.pumpWidget(const MaterialApp(
        home: StarterApp(
      key: Key('starter'),
    )));
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('Looking up for intro center widget', (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: StarterApp(
      key: Key('starter'),
    )));

    expect(find.byType(Center), findsOneWidget);
    tester.widget<StarterApp>(find.ancestor(
        of: find.byType(Center), matching: find.byType(StarterApp)));
  });
}
