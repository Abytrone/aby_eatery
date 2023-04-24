import 'package:appwrite/appwrite.dart';

class AppwriteServer {
  static Client client = Client()
      .setEndpoint('https://localhost/v1')
      .setProject('6435978f59cab443127d')
      .setSelfSigned();
  // Use only on dev mode with a self-signed SSL cert
}
