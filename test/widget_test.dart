// Widget test for Crossword Puzzle App
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:generate_crossword/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: MainScreen(),
        ),
      ),
    );

    // Verify that the app loads (you can check for specific widgets if needed)
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
