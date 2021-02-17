import 'package:backpack/src/ui/global/widget/button.dart';
import 'package:backpack/src/ui/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Navigating to splash screen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashView()));

    tester.widget<SplashView>(find.ancestor(
        of: find.byType(Spacer), matching: find.byType(SplashView)));
  });

  testWidgets('Check for a valid splash welcome test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashView()));

    expect(find.text('Travel with People, make new Friend'), findsOneWidget);
  });
  
  testWidgets('Checking for two valid button', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashView()));

    expect(find.byType(Button), findsWidgets);
  });
}
