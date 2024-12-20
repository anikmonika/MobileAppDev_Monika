import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_tracker_app/main.dart';

void main() {
  testWidgets('Displays message when valid item is added', (WidgetTester tester) async {
    // Arrange: Build the widget tree
    await tester.pumpWidget(MyApp());

    // Act: Enter item name and quantity
    await tester.enterText(find.byType(TextField).at(0), 'Apple'); // Item name
    await tester.enterText(find.byType(TextField).at(1), '5'); // Quantity

    // Tap the "Add Item" button
    await tester.tap(find.byType(ElevatedButton));
    
    // Rebuild the widget after the tap
    await tester.pump();

    // Assert: Check that the UI updates with the correct message
    expect(find.text('Item added! Total items: 5'), findsOneWidget);
  });

  testWidgets('Displays error message for invalid input', (WidgetTester tester) async {
    // Arrange: Build the widget tree
    await tester.pumpWidget(MyApp());

    // Act: Enter invalid quantity (negative number)
    await tester.enterText(find.byType(TextField).at(0), 'Apple');
    await tester.enterText(find.byType(TextField).at(1), '-5');

    // Tap the "Add Item" button
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget after the tap
    await tester.pump();

    // Assert: Check that the error message is shown
    expect(find.text('Please enter a valid name and quantity.'), findsOneWidget);
  });

  testWidgets('Displays error message for empty item name', (WidgetTester tester) async {
    // Arrange: Build the widget tree
    await tester.pumpWidget(MyApp());

    // Act: Leave the name empty and enter quantity
    await tester.enterText(find.byType(TextField).at(0), '');
    await tester.enterText(find.byType(TextField).at(1), '5');

    // Tap the "Add Item" button
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget after the tap
    await tester.pump();

    // Assert: Check that the error message is shown
    expect(find.text('Please enter a valid name and quantity.'), findsOneWidget);
  });
}
