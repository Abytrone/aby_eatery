import 'dart:io';

import 'package:appwrite/models.dart' as models;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/diets_model.dart';
import '../components/bottom_navy.dart';
import '../components/loading_dialog.dart';
import '../constants.dart';
import '../services/products_services.dart';

class ProductsController extends GetxController {
  final ProductServices productServices = ProductServices();

  Rx<Diets>? diets = Rx<Diets>(const Diets(products: null, user: null));

  Future<Diets?> getAllProducts() async {
    final result = await productServices.getAllProducts();
    Diets? diet;
    for (var i = 0; i < result!.documents.length; i++) {
      final owner = await productServices.getProductOwner(
          userId: result.documents[i].data['userid']);
      diet = Diets(products: result, user: owner!);
    }
    diets!.value = diet!;
    update();
    return diet;
  }

  var userProducts = {}.obs;
  Future<models.DocumentList> getAuthUserProducts() async {
    final result = await productServices.getAuthUserProducts();
    userProducts.value = {
      'products': result!.documents,
      'total': result.total,
    };
    return result;
  }

  Future<bool> createProduct({
    required String name,
    categoryId,
    required String description,
    required List<String> nutrition,
    required List<String> ingredients,
    required List<String> instructions,
    required int status,
    required String createdAt,
  }) async {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LoadingDialog();
      },
    );
    try {
      List<String> imagesID = [];
      if (isFilePicked.value == true) {
        for (var i = 0; i < imagePaths.length; i++) {
          final result =
              await productServices.uploadPictures(path: imagePaths[i]);
          imagesID.add(result!);
        }
        if (imagesID != []) {
          final result = await productServices.createProduct(
            name: name,
            images: imagesID,
            description: description,
            nutrition: nutrition,
            ingredients: ingredients,
            instructions: instructions,
            status: status,
            categoryId: categoryId,
            createdAt: createdAt,
          );
          if (result == true) {
            Navigator.of(Get.context!).pop();
            Get.off(() => const BottomNavy(page: 2));
            return true;
          } else {
            for (var i = 0; i < imagesID.length; i++) {
              await productServices.deletePictures(fileId: imagesID[i]);
            }
            Navigator.of(Get.context!).pop();
            return false;
          }
        } else {
          Navigator.of(Get.context!).pop();
          return false;
        }
      } else {
        Navigator.of(Get.context!).pop();
        return false;
      }
    } catch (e) {
      Navigator.of(Get.context!).pop();
      return false;
    }
  }

  // product images
  List<File> images = [];
  List<String> imagePaths = [];
  var isFilePicked = false.obs;
  Future<bool> pickImages() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
      );
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();

        for (var i = 0; i < files.length; i++) {
          images.add(files[i]);
          imagePaths.add(files[i].path);
        }
        isFilePicked(true);
        Get.snackbar(
          'Success Message',
          'You have selected ${result.files.length} pictures',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
        );
        return true;
      } else {
        isFilePicked(false);

        // User canceled the picker
        Get.snackbar(
          'Warning Message',
          'You haven\'t picked any pictures',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          colorText: Colors.white,
          backgroundColor: kWarninngColor,
        );
        return false;
      }
    } catch (e) {
      isFilePicked(false);

      // file picker fail
      Get.snackbar(
        'Error Message',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: kErrorColor,
      );
      return false;
    }
  }
}
