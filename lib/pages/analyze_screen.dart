import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prac/pages/analyze_widget.dart';

class AnalyzeScreen extends StatelessWidget {
  const AnalyzeScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //     highlightColor: Color.fromARGB(255, 28, 199, 119),
      //     canvasColor: const Color(0xFFFDF5EC),
      //     textTheme: TextTheme(
      //       headlineSmall: ThemeData.light()
      //           .textTheme
      //           .headlineSmall!
      //           .copyWith(color: const Color.fromARGB(255, 28, 199, 119)),
      //     ),
      //     iconTheme: IconThemeData(
      //       color: Colors.grey[600],
      //     ),
      //     appBarTheme: const AppBarTheme(
      //       backgroundColor: Color.fromARGB(255, 28, 199, 119),
      //       centerTitle: false,
      //       foregroundColor: Colors.white,
      //       actionsIconTheme: IconThemeData(color: Colors.white),
      //     ),
      //     elevatedButtonTheme: ElevatedButtonThemeData(
      //       style: ButtonStyle(
      //         backgroundColor: MaterialStateColor.resolveWith(
      //             (states) => const Color.fromARGB(255, 28, 199, 119)),
      //       ),
      //     ),
      //     outlinedButtonTheme: OutlinedButtonThemeData(
      //       style: ButtonStyle(
      //         foregroundColor: MaterialStateColor.resolveWith(
      //           (states) => const Color.fromARGB(255, 28, 199, 119),
      //         ),
      //         side: MaterialStateBorderSide.resolveWith((states) =>
      //             const BorderSide(color: Color.fromARGB(255, 28, 199, 119))),
      //       ),
      //     ),
      //     colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      //         .copyWith(background: const Color(0xFFFDF5EC))),
      // //home: AnalyzeBox(),
      body: const AnalyzePage(title: 'Crop Health Monitor'),
    );
  }
}

class AnalyzePage extends StatefulWidget {
  final String title;

  const AnalyzePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _AnalyzePageState createState() => _AnalyzePageState();
}

class _AnalyzePageState extends State<AnalyzePage> {
  XFile? _pickedFile;
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: Text(widget.title)) : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (kIsWeb)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Theme.of(context).highlightColor),
              ),
            ),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Widget _body() {
    if (_croppedFile != null || _pickedFile != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (_croppedFile != null)
                      Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          AnalyzeBox(),
                        ],
                      ),
                    SizedBox(height: 24),
                    _image(),
                    const SizedBox(height: 24.0),
                    _menu(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      final path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.3 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else if (_pickedFile != null) {
      final path = _pickedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                _clear();
              },
              backgroundColor: Colors.redAccent,
              tooltip: 'Delete',
              child: const Icon(Icons.delete),
            ),
            if (_croppedFile == null)
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: FloatingActionButton(
                  onPressed: () {
                    _cropImage();
                  },
                  backgroundColor: const Color.fromARGB(255, 28, 199, 119),
                  tooltip: 'Crop',
                  child: const Icon(Icons.crop),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: SizedBox(
                  width: 100,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 28, 199, 119),
                    tooltip: 'Crop',
                    child: const Text("Analyze"),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
      child: Column(
        children: [
          Card(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SizedBox(
              //width: kIsWeb ? 380.0 : 320.0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 96,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnalyzeBox(),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DottedBorder(
                        radius: const Radius.circular(12.0),
                        borderType: BorderType.RRect,
                        dashPattern: const [8, 4],
                        color:
                            Color.fromARGB(255, 86, 133, 94).withOpacity(0.4),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: Color.fromARGB(255, 86, 133, 94),
                                size: 80.0,
                              ),
                              const SizedBox(height: 24.0),
                              Text('Upload an image to start',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 86, 133, 94),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _pickImageFromGallery();
                            },
                            child: const Icon(
                              Icons.insert_photo_rounded,
                              color: Color.fromARGB(255, 86, 133, 94),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              _pickImageFromCamera();
                            },
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Color.fromARGB(255, 86, 133, 94),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Color.fromARGB(255, 86, 133, 94),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  Future _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  Future _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  void _clear() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
  }
}
