import 'dart:io';

import 'package:flutter/material.dart';
import 'package:placeapp/widget/image_input.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = 'Add-Places-Screen';
  const AddPlacesScreen({super.key});

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _onSelectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlaces() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Great Places'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: _titleController,
                  ),
                  const SizedBox(height: 10,),
                  ImageInput(_onSelectImage),
                  TextButton(onPressed: () {}, child: const Text('...'))
                ],
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))
                ),
                icon: const Icon(Icons.add),
                onPressed: () {}, 
                label: const Text('Add Places')
              )
            ],
          ),
        ),
      ),
    );
  }
}