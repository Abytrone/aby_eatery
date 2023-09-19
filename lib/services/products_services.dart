import 'package:aby_eatery/services/local_service.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;

import 'appwrite_server.dart';
import 'constants.dart';

class ProductServices {
  final Account account = Account(AppwriteServer.client);
  final Storage storage = Storage(AppwriteServer.client);
  final Databases databases = Databases(AppwriteServer.client);

  Future<model.DocumentList?> getAuthUserProducts({String? status}) async {
    try {
      final currentUser = await account.get();
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: dietsCollectionId, // diets
        queries: [
          Query.search('userid', currentUser.$id),
          status == null
              ? Query.notEqual('status', '2')
              : Query.equal('status', status),
        ],
      );
      // if (result.documents.isNotEmpty) {
      //   print(result.documents[0].data);
      // }
      return result;
    } on AppwriteException catch (e) {
      // print(e.message);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      return null;
    }
  }

  Future<model.DocumentList?> getProductOwner({required String userId}) async {
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

  Future<model.DocumentList?> getAllProducts() async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: dietsCollectionId, // diets
        queries: [Query.equal('status', '1')],
      );
      // print(result.documents);
      return result;
    } on AppwriteException catch (e) {
      // print(e.message);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      return null;
    }
  }

  Future<model.DocumentList?> getRecentProducts() async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: dietsCollectionId, // diets
        queries: [
          Query.orderDesc('name'),
          Query.equal('status', '1'),
          Query.limit(5),
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

  Future<model.DocumentList?> searchProducts({required String search}) async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: dietsCollectionId, // diets
        queries: [
          Query.search('name', search),
          Query.equal('status', '1'),
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

  Future<String?> uploadPictures({required String path}) async {
    try {
      final result = await storage.createFile(
        bucketId: productPicturesBucket,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: path),
      );
      return result.$id;
    } on AppwriteException {
      // print(e);
      return null;
    }
  }

  Future<bool> deletePictures({required String fileId}) async {
    try {
      await storage.deleteFile(
        bucketId: productPicturesBucket,
        fileId: fileId,
      );
      // print('File deleted');
      return true;
    } on AppwriteException {
      // print(e);
      return false;
    }
  }

  Future<bool> deleteProduct({required String id}) async {
    try {
      await databases.deleteDocument(
        databaseId: databaseId,
        collectionId: dietsCollectionId,
        documentId: id,
      );
      // print(result);
      return true;
    } on AppwriteException catch (e) {
      // print(e);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      return false;
    }
  }

  Future<bool> createProduct({
    required String name,
    // categoryId,
    required List<String> images,
    required String description,
    required List<String> nutrition,
    required List<String> ingredients,
    required List<String> instructions,
    required int status,
    required String createdAt,
  }) async {
    try {
      final currentUser = await account.get();
      await databases.createDocument(
        documentId: ID.unique(),
        databaseId: databaseId,
        collectionId: dietsCollectionId, // diets
        data: {
          'userid': currentUser.$id,
          'name': name,
          'images': images,
          'description': description,
          'nutrition': nutrition,
          'ingredients': ingredients,
          'instructions': instructions,
          'status': status.toString(),
          // 'categoryid': categoryId,
          // 'created_at': createdAt,
        },
      );
      AbySnackBar.successSnackbar(
          text: 'You have successfully uploaded a product');
      // print(result.documents);
      return true;
    } on AppwriteException catch (e) {
      // print(e.message);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      return false;
    }
  }

  Future<bool> updateProduct({
    required String name,
    documentId,
    categoryId,
    required List<String> images,
    required String description,
    required List<String> nutrition,
    required List<String> ingredients,
    required List<String> instructions,
    required int status,
    required String createdAt,
  }) async {
    try {
      // final currentUser = await account.get();
      await databases.updateDocument(
        documentId: documentId,
        databaseId: databaseId,
        collectionId: dietsCollectionId, // diets
        data: {
          // 'userid': currentUser.$id,
          'name': name,
          'images': images,
          'description': description,
          'nutrition': nutrition,
          'ingredients': ingredients,
          'instructions': instructions,
          'status': status,
          'categoryid': categoryId,
          // 'created_at': createdAt,
        },
      );
      AbySnackBar.successSnackbar(
          text: 'You have successfully uploaded a product');
      // print(result.documents);
      return true;
    } on AppwriteException catch (e) {
      // print(e.message);
      AbySnackBar.errorSnackbar(text: '${e.message}');
      return false;
    }
  }
}
