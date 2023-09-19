import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:get/get.dart';

import '../services/appwrite_server.dart';
import '../services/auth_services.dart';

class UserController extends GetxController {
  final AuthServices authServices = AuthServices();
  final Storage storage = Storage(AppwriteServer.client);
  var user = {}.obs;
  Future<model.Account?> getUser() async {
    final result = await authServices.getUser();
    final authUser = await authServices.getAuthUser();
    user.value = {
      'image': authUser!.documents[0].data['image'],
      'description': authUser.documents[0].data['description'],
      'name': result.name,
      'email': result.email,
      'emailVerification': result.emailVerification,
      'passwordUpdate': result.passwordUpdate,
      'phone': result.phone,
      'phoneVerification': result.phoneVerification,
      'prefs': result.prefs,
      'registration': result.registration,
      'status': result.status,
      'createdAt': result.$createdAt,
      'id': result.$id,
      'updatedAt': result.$updatedAt
    };
    return result;
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
