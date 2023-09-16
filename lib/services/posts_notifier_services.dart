import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifertest/posts_model.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super(<Post>[]);
  List<Post> posts = [];

  Future<List<Post>> getPosts() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    var dio = Dio();

    try {
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        List data = res.data as List;
        posts = data.map((e) => Post.fromJson(e)).toList();
      }
    } on DioException catch (e) {
      Future.error(e);
    }
    return posts;
  }

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
    state = [...state.where((element) => element.id != id).toList()];
  }

  void reversePost() {
    state = [...state.reversed.toList()];
  }
}
