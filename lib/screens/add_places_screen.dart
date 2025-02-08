import 'package:flutter/material.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = 'Add-Places-Screen';
  const AddPlacesScreen({super.key});

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Great Places'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Column(
              children: [
                TextField(),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {}, 
            label: const Text('Add Places')
          )
        ],
      ),
    );
  }
}