import 'package:base_template_bloc/features/data/data_sources/home_api.dart';
import 'package:base_template_bloc/features/data/models/post_model.dart';
import 'package:base_template_bloc/features/data/models/user_model.dart';
import 'package:base_template_bloc/features/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<List<Post>> fetchPosts() async {
    final data = await HomeAPI.fetchPosts().request();
    return (data as List).map((e) => Post.fromJson(e)).toList();
  }

  @override
  Future<List<User>> fetchUsers() async {
    final data = await HomeAPI.fetchUser().request();
    return (data as List).map((e) => User.fromJson(e)).toList();
  }
}
