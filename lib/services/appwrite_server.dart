import 'package:appwrite/appwrite.dart';

import 'constants.dart';

class AppwriteServer {
  static Client client = Client()
      .setEndpoint('https://$endPoint')
      .setProject(projectId)
      .setSelfSigned();
  // Use only on dev mode with a self-signed SSL cert
}
