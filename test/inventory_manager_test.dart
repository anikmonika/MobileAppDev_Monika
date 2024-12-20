import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_tracker_app/inventory_manager.dart';

void main() {
  test('addItem adds a new item to inventory', () {
    // Arrange
    final manager = InventoryManager();

    // Act
    manager.addItem('Apple', 5);

    // Assert
    expect(manager.totalItems, equals(5));
  });

  test('addItem updates quantity for existing item', () {
    // Arrange
    final manager = InventoryManager();

    // Act
    manager.addItem('Apple', 5);
    manager.addItem('Apple', 3);

    // Assert
    expect(manager.totalItems, equals(8));
  });

  test('totalItems returns 0 for empty inventory', () {
    // Arrange
    final manager = InventoryManager();

    // Assert
    expect(manager.totalItems, equals(0));
  });
}
