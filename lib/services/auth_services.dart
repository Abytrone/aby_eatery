import 'package:aby_eatery/services/appwrite_server.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/status_dialog.dart';
import '../constants.dart';
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
      Future.delayed(
        const Duration(seconds: 6),
        () {
          Get.offAllNamed('login');
        },
      );
      Get.snackbar(
        'Success Message',
        'You have successefully signed up ${user.name}.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: kPrimaryColor,
      );
      loading(false);
      return user.status;
    } on AppwriteException catch (e) {
      Get.snackbar(
        'Error Message (${e.code})',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: kErrorColor,
      );
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
      final user = await account.createEmailSession(
        email: email,
        password: password,
      );

      final SharedPreferences localStorage =
          await SharedPreferences.getInstance();
      localStorage.setString('sessionId', user.$id);
      localStorage.setString('userId', user.userId);
      Get.offAllNamed('bottomNavy');
      loading(false);
      Get.snackbar(
        'Success Message',
        'You have successefully signed in ${user.clientName}.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: kPrimaryColor,
      );
      return true;
    } on AppwriteException catch (e) {
      Get.snackbar(
        'Error Message (${e.code})',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: kErrorColor,
      );
      loading(false);
      return false;
    }
  }

  Future<dynamic> logout({required String sessionId}) async {
    try {
      final SharedPreferences localStorage =
          await SharedPreferences.getInstance();
      account.deleteSession(sessionId: sessionId);
      localStorage.remove('sessionId');
      localStorage.remove('userId');
      Get.offAllNamed('welcome');
      Get.snackbar(
        'Success Message',
        'You have successefully logged out.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: kPrimaryColor,
      );
      return true;
    } on AppwriteException catch (e) {
      Get.snackbar(
        'Error Message (${e.code})',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: kErrorColor,
      );
      return false;
    }
  }

  Future<model.Account> getUser() async {
    final currentUser = account.get();
    return currentUser;
  }
    Future<model.DocumentList?> getAuthUser() async {
    try {
      final currentUser = await account.get();
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: usersCollectionId, // users
        queries: [Query.search('userid', currentUser.$id)],
      );
      // print(result.documents[0].data['name']);
      return result;
    } on AppwriteException catch (e) {
      // print(e.message);
      Get.snackbar(
        'Error Message (${e.code})',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: kErrorColor,
      );
      return null;
    }
  }
}
