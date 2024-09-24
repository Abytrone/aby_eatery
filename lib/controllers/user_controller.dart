import 'dart:io' as io;

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../services/appwrite_server.dart';
import '../services/auth_services.dart';
import '../services/local_service.dart';

class UserController extends GetxController {
  final AuthServices authServices = AuthServices();
  final Storage storage = Storage(AppwriteServer.client);

  // @override
  // void onInit() {
  //   // getUser();
  //   super.onInit();
  // }

  var user = Rxn<model.User>().obs;
  Future<model.User?> getUser() async {
    final result = await authServices.getUser();
    user.value.value = result;
    return result;
  }

  var image = Rxn<io.File?>().obs;
  String? imagePath;
  var isFilePicked = false.obs;
  Future<bool> pickProfilePicture() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        io.File file = io.File(result.files.single.path!);
        image.value.value = file;
        imagePath = file.path;
        isFilePicked(true);
        profilePicture(picPath: file.path);
        // AbySnackBar.successSnackbar(text: 'Image selected successfully!');
        return true;
      } else {
        isFilePicked(false);
        // User canceled the picker
        // AbySnackBar.errorSnackbar(text: 'You haven\'t picked any pictures');
        return false;
      }
    } catch (e) {
      isFilePicked(false);
      // file picker fail
      AbySnackBar.errorSnackbar(text: '$e');
      return false;
    }
  }

  Future<bool> profilePicture({required String picPath}) async {
    final response = await authServices.updateProfilePicture(
      address: user.value.value!.prefs.data['address'],
      description: user.value.value!.prefs.data['description'],
      role: user.value.value!.prefs.data['role'],
      path: picPath,
    );
    if (response == true) {
      getUser();
      return true;
    } else {
      return false;
    }
  }
}
