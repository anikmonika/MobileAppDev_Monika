class InventoryManager {
  final Map<String, int> _inventory = {};

  void addItem(String name, int quantity) {
    if (_inventory.containsKey(name)) {
      _inventory[name] = _inventory[name]! + quantity;
    } else {
      _inventory[name] = quantity;
    }
  }

  int get totalItems {
    return _inventory.values.fold(0, (sum, quantity) => sum + quantity);
  }
}
