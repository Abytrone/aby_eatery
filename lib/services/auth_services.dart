import 'package:aby_eatery/controllers/user_controller.dart';
import 'package:aby_eatery/services/appwrite_server.dart';
import 'package:aby_eatery/services/local_service.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/status_dialog.dart';
import 'constants.dart';

class AuthServices {
  // Register User
  final Account account = Account(AppwriteServer.client);
  final Storage storage = Storage(AppwriteServer.client);
  final Databases databases = Databases(AppwriteServer.client);
  var loading = false.obs;

  Future<bool> signup({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      loading(true);
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );

      Get.dialog(
        const StatusDialog(),
        barrierDismissible: false,
      );

      await account
          .createEmailPasswordSession(
        email: email,
        password: password,
      )
          .then((session) async {
        await account.updatePrefs(
          prefs: {
            'address': 'Address not added yet!',
            'description': 'Description not added yet!',
            'role': 'user',
            'profile': '66f1723b00373d8c74c2',
          },
        ).then((user) {
          account.deleteSession(sessionId: session.$id);
        });
      });

      Future.delayed(const Duration(seconds: 6), () {
        Get.offAllNamed('login');
      });
      AbySnackBar.successSnackbar(
          text: 'You have successefully signed up ${user.name}.');
      loading(false);
      return user.status;
    } on AppwriteException catch (e) {
      // print(e);
      AbySnackBar.errorSnackbar(text: 'Error Message (${e.message})');
      loading(false);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      loading(true);
      final session = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );

      final localStorage = await SharedPreferences.getInstance();
      localStorage.setString('sessionId', session.$id);
      localStorage.setString('userId', session.userId);

      final prefs = await account.getPrefs();

      getUser().then((_) {
        if (prefs.data['role'] == 'admin') {
          Get.offAllNamed('bottomNavy');
        } else {
          Get.offAllNamed('userBottomNavy');
        }
      });

      loading(false);
      AbySnackBar.successSnackbar(
          text: 'You have successefully signed in ${session.clientName}.');

      return true;
    } on AppwriteException catch (e) {
      AbySnackBar.errorSnackbar(text: 'Error Message (${e.message})');

      loading(false);
      return false;
    }
  }

  Future<dynamic> logout({required String sessionId}) async {
    final UserController userController = Get.find();
    try {
      userController.user.value(null);
      final localStorage = await SharedPreferences.getInstance();
      account.deleteSession(sessionId: sessionId);
      localStorage.remove('sessionId');
      localStorage.remove('userId');
      Get.offAllNamed('login');
      AbySnackBar.successSnackbar(text: 'You have successefully logged out.');
      return true;
    } on AppwriteException catch (e) {
      AbySnackBar.errorSnackbar(text: 'Error Message: (${e.message})');
      return false;
    }
  }

  Future<model.User?> getUser() async {
    try {
      model.User? user;
      final prefs = await account.getPrefs();
      if (prefs.data.isEmpty) {
        user = await account.updatePrefs(
          prefs: {
            'address': 'Address not added yet!',
            'description': 'Description not added yet!',
            'role': 'user',
            'profile': '66f1723b00373d8c74c2',
          },
        );
      } else {
        user = await account.get();
      }
      return user;
    } on AppwriteException catch (e) {
      AbySnackBar.errorSnackbar(
          text: e.message ?? 'Error occured please try again!');
      return null;
    }
  }

  Future<bool> updateProfilePicture({
    required String address,
    required String description,
    required String role,
    required String path,
  }) async {
    try {
      final result = await storage.createFile(
        bucketId: profilePicturesBucket,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: path),
      );

      await account.updatePrefs(prefs: {
        'address': address,
        'description': description,
        'role': role,
        "profile": result.$id,
      });
      AbySnackBar.successSnackbar(
          text: 'Profile picture updated successfully!');
      return true;
    } on AppwriteException {
      // print(e);
      AbySnackBar.errorSnackbar(text: 'Profile picture not updated!');
      return false;
    }
  }
}
