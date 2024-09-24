import 'package:appwrite/appwrite.dart' as flutter;

import 'package:dart_appwrite/dart_appwrite.dart';

import 'constants.dart';

class AppwriteServer {
  static flutter.Client client = flutter.Client()
      .setEndpoint('https://$endPoint')
      .setProject(projectId)
      .setSelfSigned();

  static Client apiClient = Client()
      .setEndpoint('https://$endPoint')
      .setProject(projectId)
      .setKey(apiKey)
      .setSelfSigned();
  // Use only on dev mode with a self-signed SSL cert
}
