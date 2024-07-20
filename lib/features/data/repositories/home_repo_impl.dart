
import 'package:base_template_bloc/features/data/data_sources/post_api.dart';
import 'package:base_template_bloc/features/data/models/home_model.dart';
import 'package:base_template_bloc/features/domain/repositories/home_repo.dart';

class PostRepoImpl implements PostRepo {
  @override
  Future<List<Post>> fetchPosts() async {
    final data = await PostAPI.fetchPosts().request();
    return (data as List).map((e) => Post.fromJson(e)).toList();
  }
}
