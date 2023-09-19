import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/loading_dialog.dart';
import 'appwrite_server.dart';
import 'constants.dart';
import 'local_service.dart';

class CommentServices {
  final Account account = Account(AppwriteServer.client);
  final Storage storage = Storage(AppwriteServer.client);
  final Databases databases = Databases(AppwriteServer.client);

  Future<bool> addComment({
    required String comment,
    required String dietId,
  }) async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const LoadingDialog();
      },
    );
    try {
      final currentUser = await account.get();
      await databases.createDocument(
        documentId: ID.unique(),
        databaseId: databaseId,
        collectionId: commentsCollectionId, // comments
        data: {
          'userid': currentUser.$id,
          'dietid': dietId,
          'comment': comment,
        },
      );
      Navigator.of(Get.overlayContext!).pop();
      AbySnackBar.successSnackbar(text: 'Comment added');
      // print(result.documents);
      return true;
    } on AppwriteException catch (e) {
      // print(e.message);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      Navigator.of(Get.overlayContext!).pop();
      return false;
    }
  }

  Future<model.DocumentList?> getComments({required String dietid}) async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: commentsCollectionId, // comments
        queries: [
          Query.equal('dietid', dietid),
        ],
      );
      // print(result.documents);
      return result;
    } on AppwriteException catch (e) {
      // print(e.message);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      return null;
    }
  }

  Future<model.DocumentList?> getCommentor({required String userId}) async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: usersCollectionId, // users
        queries: [Query.search('userid', userId)],
      );
      // print(result.documents[0].data['name']);
      return result;
    } on AppwriteException catch (e) {
      // print(e.message);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      return null;
    }
  }
}
