import 'package:appwrite/appwrite.dart';

class AppwriteServer {
  static Client client = Client()
      .setEndpoint('https://localhost/v1')
      .setProject('6435978f59cab443127d')
      .setSelfSigned();
  // Use only on dev mode with a self-signed SSL cert
}

class AuthServices {
  // Register User
  final Account account = Account(AppwriteServer.client);

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
}
