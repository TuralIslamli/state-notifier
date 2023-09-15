import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifertest/posts_model.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super(<Post>[]);

  void addPost({required String title, required String text}) {
    state = [
      ...state,
      Post(
          userId: int.parse(DateTime.now().toString()),
          id: int.parse(DateTime.now().toString()),
          title: title,
          body: text)
    ];
  }

  void delPosts(int id) {
    state = state.where((element) => element.id != id).toList();
  }

  void reversePost() {
    state = state.reversed.toList();
  }
}
