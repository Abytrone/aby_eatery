import 'package:aby_eatery/services/comments_services.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  final CommentServices commentServices = CommentServices();
  Future<bool> addComment({
    required String comment,
    required String dietId,
  }) async {
    final result =
        await commentServices.addComment(comment: comment, dietId: dietId);

    if (result == true) {
      getComments(dietid: dietId);
      return true;
    } else {
      return false;
    }
  }

  var loading = false.obs;
  var comments = Rxn<Comment?>().obs;
  Future<bool> getComments({required String dietid}) async {
    loading(true);
    final result = await commentServices.getComments(dietid: dietid);
    Comment? comment;
    for (var i = 0; i < result!.documents.length; i++) {
      final commentor = await commentServices.getCommentor(
          userId: result.documents[i].data['userid']);
      comment = Comment(comment: result, user: commentor!);
    }

    if (comment != null) {
      comments.value.value = comment;
      loading(false);
      return true;
    } else {
      loading(false);
      return false;
    }
  }
}

class Comment {
  final DocumentList comment;
  final DocumentList user;

  Comment({
    required this.comment,
    required this.user,
  });
}
