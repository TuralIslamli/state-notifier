import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifertest/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataRef = ref.read(postsNotifierProvider.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(postsNotifierProvider.notifier).reversePost();
        },
        child: const Text("reverse"),
      ),
      body: FutureBuilder(
          future: dataRef.getPosts(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text(snapshot.data![index].id.toString()),
                      title: Text(snapshot.data![index].title!),
                      subtitle: Text(snapshot.data![index].body!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          ref
                              .watch(postsNotifierProvider.notifier)
                              .delPosts(snapshot.data![index].id!);
                        },
                      ),
                    );
                  },
                )
              : const CircularProgressIndicator()),
    );
  }
}
