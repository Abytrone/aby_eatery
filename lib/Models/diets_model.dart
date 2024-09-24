import 'package:appwrite/models.dart';
import 'package:dart_appwrite/models.dart' as dart;

class Diets {
  final DocumentList? products;
  final dart.User? user;

  const Diets({
    this.products,
    this.user,
  });
}
