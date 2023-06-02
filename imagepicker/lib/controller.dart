import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'imageloadprovider.dart';

class Controller extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Crop
      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Compress

      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + "/temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 90);
      compressImagePath.value = compressedFile.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      uploadImage(compressedFile);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void uploadImage(File file) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    ImageUploadProvider().uploadImage(file).then((resp) {
      Get.back();
      if (resp == "success") {
        Get.snackbar('Success', 'File Uploaded',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else if (resp == "fail") {
        Get.snackbar('Error', 'File upload failed',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }, onError: (err) {
      Get.back();
      Get.snackbar('Error', 'File upload failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    });
  }
}



// import 'dart:html';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:imagepicker/imageloadprovider.dart';

// class Controller extends GetxController {
//   var selectedImagePath = ''.obs;
//   final ImagePicker _picker = ImagePicker();
//   List<XFile>? images = [];
//   List<String> listImagepath = [];
//   var selectedFileCount = 0.obs;

//   var compressImagePath = ''.obs;
//   var compressImageSize = ''.obs;

//   // void selectMultipleImage(ImageSource imageSource) async {
//   //   images = await _picker.pickMultiImage();
//   //   if (images != null) {
//   //     for (XFile file in images!) {
//   //       listImagepath.add(file.path);
//   //     }
//   //   } else {
//   //     Get.snackbar("", "Image Not pick");
//   //   }
//   //   selectedFileCount.value = listImagepath.length;
//   // }
//  void getImage(ImageSource imageSource) async {
//     final PickedFile = await ImagePicker().getImage(source: imageSource);
//     if (PickedFile != null) {
//       selectedImagePath.value = PickedFile.path;
//       print(selectedImagePath.toString());
//     } else {
//       Get.snackbar("", "Image Not pick");
//     }
//   }
//   void uploadImage(File file) {
//     Get.dialog(
//     const  Center(
//         child: CircularProgressIndicator(),
//       ),
//       barrierDismissible: false,
//     );
//     ImageUplodeProvider().uplodeImage(file).then((resp) {
//       Get.back();
//       if (resp == "success") {
//         Get.snackbar('Success', 'File Uploaded',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.green,
//             colorText: Colors.white);
//       } else if (resp == "fail") {
//         Get.snackbar('Error', 'File upload failed',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//       }
//     }, onError: (err) {
//       Get.back();
//       Get.snackbar('Error', 'File upload failed',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     });
//   }
//   // void uplodeImage() {
//   //   if (selectedFileCount.value > 0) {
//   //     Get.dialog(
//   //         const Center(
//   //           child: CircularProgressIndicator(),
//   //         ),
//   //         barrierDismissible: false);
//   //     ImageUplodeProvider().uplodeImage(listImagepath).then((resp) {
//   //       Get.back();
//   //       if (resp == 'success') {
//   //         Get.snackbar("", "Image  uplodeded");
//   //         images = [];
//   //         listImagepath = [];
//   //         selectedFileCount.value = listImagepath.length;
//   //       }
//   //     }).onError((error, stackTrace) {
//   //       Get.back();
//   //       Get.snackbar("", "Image Not uplodemSomthing wrong");
//   //     });
//   //   } else {
//   //     Get.snackbar("", "Image Not uplode");
//   //   }
//   // }

 
// }
