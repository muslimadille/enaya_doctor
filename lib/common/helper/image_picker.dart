import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickerImage{

  static PickerImage? _singleton;

  factory PickerImage() {
    _singleton = _singleton ?? PickerImage._internal();
    return _singleton!;
  }

  PickerImage._internal();

  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage({required ImageSource source})async{
    // ImageSource.camera,ImageSource.gallery
    try {
      final XFile? image = await _picker.pickImage(source: source);
      return image;
    }on PlatformException catch(error){
      log(error.message.toString());
    }
  }

  Future<CroppedFile?> cropImage({required String imagePath}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          )
        ]
    );

    return croppedFile;
  }

  Future<XFile?> compressImage({required String  imagePath,required String newPath,required int imageQuality}) async {
    XFile? compressImage = await FlutterImageCompress.compressAndGetFile(
      imagePath, newPath,
      quality: imageQuality,
    );
    return compressImage;
  }
}