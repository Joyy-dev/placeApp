import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

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