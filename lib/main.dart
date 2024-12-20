import 'package:flutter/material.dart';
import 'inventory_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InventoryScreen(),
    );
  }
}

class InventoryScreen extends StatefulWidget {
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final InventoryManager _inventoryManager = InventoryManager();
  String _message = "";

  void _addItem() {
    final String name = _nameController.text.trim();
    final int? quantity = int.tryParse(_quantityController.text);

    if (name.isEmpty || quantity == null || quantity <= 0) {
      setState(() {
        _message = "Please enter a valid name and quantity.";
      });
      return;
    }

    _inventoryManager.addItem(name, quantity);
    setState(() {
      _message = "Item added! Total items: ${_inventoryManager.totalItems}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
