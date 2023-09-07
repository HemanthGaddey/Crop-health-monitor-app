import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MaterialButton(
            color: Colors.blue,
            child: const Text("gallery"),
            onPressed: () {
              _pickImageFromGallery();
            },
          ),
          MaterialButton(
            color: Colors.red,
            child: const Text("camera"),
            onPressed: () {
              _pickImageFromCamera();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          _selectedImage != null
              ? Image.file(_selectedImage!)
              : const Text('please select an image file.'),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
