import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenotifertest/posts_model.dart';
import 'package:statenotifertest/services/posts_notifier_services.dart';

final postsNotifierProvider =
    StateNotifierProvider<PostNotifier, List<Post>>((ref) => PostNotifier());
