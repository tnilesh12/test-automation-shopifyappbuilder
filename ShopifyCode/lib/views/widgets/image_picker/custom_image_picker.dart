import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  final picker = ImagePicker();

  Future<File> imgFromCamera() async {
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
      final File file = File(pickedFile!.path);
      return file;
    } catch (e) {
      return File('');
    }
  }

  Future<File> openGallery() async {
    try {
      final pickedFile = await picker.pickImage(
          source: ImageSource.gallery, imageQuality: 100);
      final File file = File(pickedFile!.path);
      return file;
    } catch (e) {
      return File('');
    }
  }
}
