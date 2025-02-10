import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function _onSelectImage;

  ImageInput(this._onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePictures() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera, 
      maxWidth: 600
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final fileDirectory = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await File(imageFile.path).copy('${fileDirectory.path}/$fileName');
    widget._onSelectImage(savedImage);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            color: Colors.grey
          ),
          alignment: Alignment.center,
          child: _storedImage != null 
          ? Image.file(
            _storedImage!, 
            fit: BoxFit.cover,
          ) 
          : const Text('...'),
        ),
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor
            ),
            onPressed: () {
              _takePictures();
            },
            icon: const Icon(Icons.camera),
            label: const Text('Take a picture', textAlign: TextAlign.center,),
          )
        )
      ],
    );
  }
}