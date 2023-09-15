import 'package:dio/dio.dart';
import 'package:statenotifertest/posts_model.dart';

Future<List<Post>> getPosts() async {
  String url = "https://jsonplaceholder.typicode.com/posts";
  var dio = Dio();

  try {
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      List data = res.data as List;
      return data.map((e) => Post.fromJson(e)).toList();
    }
  } on DioException catch (e) {
    Future.error(e);
  }
  return [];
}
