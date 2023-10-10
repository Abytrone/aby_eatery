import 'dart:io';

import 'package:aby_eatery/services/local_service.dart';
import 'package:appwrite/models.dart' as model;
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

  // @override
  // void onInit() {
  //   getAllProducts();
  //   getRecentProducts();
  //   getAuthUserProducts();
  //   getAuthUserDraftProducts();
  //   getAuthUserPublishedProducts();
  //   super.onInit();
  // }

  var loadingDiets = false.obs;
  var diets = Rxn<Diets>().obs;
  Future<bool> getAllProducts() async {
    loadingDiets(true);
    final result = await productServices.getAllProducts();
    Diets? diet;
    for (var i = 0; i < result!.documents.length; i++) {
      final owner = await productServices.getProductOwner(
          userId: result.documents[i].data['userid']);
      diet = Diets(products: result, user: owner!);
    }

    if (diet != null) {
      diets.value.value = diet;
      loadingDiets(false);
      return true;
    } else {
      loadingDiets(false);
      return false;
    }
  }

  var loadingRecents = false.obs;
  var recentDiets = Rxn<Diets>().obs;
  Future<bool> getRecentProducts() async {
    loadingRecents(true);
    final result = await productServices.getRecentProducts();
    Diets? diet;

    if (result != null) {
      for (var i = 0; i < result.documents.length; i++) {
        final owner = await productServices.getProductOwner(
            userId: result.documents[i].data['userid']);
        diet = Diets(products: result, user: owner!);
      }

      if (diet != null) {
        recentDiets.value.value = diet;
        loadingRecents(false);
        return true;
      } else {
        loadingRecents(false);
        return false;
      }
    } else {
      loadingRecents(false);
      return false;
    }
  }

  var searchDiets = Rxn<Diets>().obs;
  var hasSearched = false.obs;
  Future<bool> searchProucts({required String search}) async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const LoadingDialog();
      },
    );
    searchDiets.value.value = null;
    final result = await productServices.searchProducts(search: search);
    Diets? diet;
    if (result != null) {
      for (var i = 0; i < result.documents.length; i++) {
        final owner = await productServices.getProductOwner(
            userId: result.documents[i].data['userid']);
        diet = Diets(products: result, user: owner!);
      }

      if (diet != null) {
        searchDiets.value.value = diet;
        hasSearched(true);
        Navigator.of(Get.overlayContext!).pop();
        return true;
      } else {
        Navigator.of(Get.overlayContext!).pop();
        hasSearched(true);
        return false;
      }
    } else {
      Navigator.of(Get.overlayContext!).pop();
      hasSearched(true);
      return false;
    }
  }

  var userProducts = Rxn<model.DocumentList>().obs;
  Future<bool> getAuthUserProducts() async {
    final result = await productServices.getAuthUserProducts();

    if (result != null) {
      userProducts.value.value = result;
      return true;
    } else {
      return false;
    }
  }

  var userDraftProducts = Rxn<model.DocumentList>().obs;
  Future<bool> getAuthUserDraftProducts() async {
    final result = await productServices.getAuthUserProducts(status: '0');

    if (result != null) {
      userDraftProducts.value.value = result;
      return true;
    } else {
      return false;
    }
  }

  var userPublishedProducts = Rxn<model.DocumentList>().obs;
  Future<bool> getAuthUserPublishedProducts() async {
    final result = await productServices.getAuthUserProducts(status: '1');

    if (result != null) {
      userPublishedProducts.value.value = result;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProduct({required String id}) async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const LoadingDialog();
      },
    );
    final result = await productServices.deleteProduct(id: id);

    if (result == true) {
      getAllProducts();
      getAuthUserDraftProducts();
      getAuthUserProducts();
      getAuthUserPublishedProducts();
      getRecentProducts();
      Navigator.of(Get.overlayContext!).pop();
      return true;
    } else {
      Navigator.of(Get.overlayContext!).pop();
      return false;
    }
  }

  Future<bool> createProduct({
    required String name,
    // categoryId,
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
            // categoryId: categoryId,
            createdAt: createdAt,
          );
          if (result == true) {
            getAllProducts();
            getAuthUserDraftProducts();
            getAuthUserProducts();
            getAuthUserPublishedProducts();
            getRecentProducts();
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
      AbySnackBar.errorSnackbar(text: '$e');
      return false;
    }
  }
}
