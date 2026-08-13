import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(const KeyDemoApp());

class KeyDemoApp extends StatelessWidget {
  const KeyDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KeyDemoScreen(),
    );
  }
}

class KeyDemoScreen extends StatefulWidget {
  const KeyDemoScreen({super.key});

  @override
  State<KeyDemoScreen> createState() => _KeyDemoScreenState();
}

class _KeyDemoScreenState extends State<KeyDemoScreen> {
  // Toggle to turn ValueKey on/off
  bool useKeys = false;

  // Initial list of items
  late List<ItemData> items;

  @override
  void initState() {
    super.initState();
    _resetItems();
  }

  void _resetItems() {
    setState(() {
      items = [
        ItemData(id: 101, title: 'Tile 1'),
        ItemData(id: 102, title: 'Tile 2'),
        ItemData(id: 103, title: 'Tile 3'),
      ];
    });
  }

  void _swapFirstTwo() {
    setState(() {
      final temp = items[0];
      items[0] = items[1];
      items[1] = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Key Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetItems,
            tooltip: 'Reset List',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Control Switch
            Card(
              color: useKeys ? Colors.green.shade50 : Colors.red.shade50,
              child: SwitchListTile(
                title: Text(
                  useKeys
                      ? 'Keys Enabled (ValueKey)'
                      : 'Keys Disabled (No Keys)',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  useKeys
                      ? 'Flutter tracks widget identity using item IDs.'
                      : 'Flutter tracks widgets strictly by list position.',
                ),
                value: useKeys,
                onChanged: (val) {
                  setState(() {
                    useKeys = val;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            // Swap Button
            ElevatedButton.icon(
              onPressed: _swapFirstTwo,
              icon: const Icon(Icons.swap_vert),
              label: const Text('Swap Tile 1 & Tile 2'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            const SizedBox(height: 20),

            // Tile List
            Expanded(
              child: ListView(
                children: items.map((item) {
                  if (useKeys) {
                    // WITH KEY: Flutter maps the state to the unique ID
                    return ColorTile(key: ValueKey(item.id), title: item.title);
                  } else {
                    // WITHOUT KEY: Flutter maps the state to the index position
                    return ColorTile(title: item.title);
                  }
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data Model
class ItemData {
  final int id;
  final String title;
  ItemData({required this.id, required this.title});
}

// Stateful Tile Widget
class ColorTile extends StatefulWidget {
  final String title;

  const ColorTile({super.key, required this.title});

  @override
  State<ColorTile> createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  late Color tileColor;

  @override
  void initState() {
    super.initState();
    // Generate a random background color ONCE when state initializes
    tileColor = Color(
      (Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          shadows: [Shadow(blurRadius: 4, color: Colors.black45)],
        ),
      ),
    );
  }
}
