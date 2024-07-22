import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectedImage});
  final void Function(File image) onSelectedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  _takeImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onSelectedImage(_selectedImage!);
  }
  
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takeImage,
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
    );
    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takeImage,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.fitHeight,
        ),
      );
    }
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(.2),
        ),
      ),
      alignment: Alignment.center,
      child: content,
    );
  }
}