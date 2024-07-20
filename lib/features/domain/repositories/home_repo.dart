import 'package:base_template_bloc/features/data/models/home_model.dart';

abstract class PostRepo {
  Future<List<Post>> fetchPosts();
}
