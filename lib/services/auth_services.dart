import 'package:aby_eatery/services/appwrite_server.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthServices {
  // Register User
  final Account account = Account(AppwriteServer.client);
  final GetStorage box = GetStorage();

  Future<bool> create() async {
    final user = await account.create(
      userId: ID.unique(),
      email: 'abytrone@gmail.com',
      password: 'abytrone',
      name: 'Abdul Basit',
    );
    print(user.status);
    return user.status;
  }

  var loading = false.obs;

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
      box.write("sessionId", user.$id);
      box.write('userId', user.userId);
      Get.offAllNamed('bottomNavy');
      loading(false);

      return true;
    } on AppwriteException catch (e) {
      loading(false);
      return false;
    }
  }

  Future<dynamic> logout({required String sessionId}) async {
    try {
      account.deleteSession(sessionId: sessionId);
      box.erase();
      Get.offAllNamed('welcome');
      return true;
    } on AppwriteException catch (e) {
      return false;
    }
  }

  Future<model.Account> get() async {
    final currentUser = account.get();
    return currentUser;
  }
}
