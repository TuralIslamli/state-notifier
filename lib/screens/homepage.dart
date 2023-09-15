import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifertest/posts_model.dart';
import 'package:statenotifertest/providers.dart';
import 'package:statenotifertest/services/api_services.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataRef = ref.read(postsNotifierProvider.notifier);
    Future<List<Post>> postApi = getPosts();
    return Scaffold(
      body: FutureBuilder(
          future: postApi,
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title!),
                      subtitle: Text(snapshot.data![index].body!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          dataRef.delPosts(snapshot.data![index].id!);
                        },
                      ),
                    );
                  },
                )
              : CircularProgressIndicator()),
    );
  }
}
