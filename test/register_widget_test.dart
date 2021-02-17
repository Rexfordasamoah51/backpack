import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the Registration View', () {
    testWidgets('looking up for the key', (tester) async {
      final registrationWidget = findsNWidgets(0);
      expect(find.byKey(const ValueKey<dynamic>('registration_view')),
          registrationWidget);
    });
  });
}
