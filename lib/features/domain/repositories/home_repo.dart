import 'package:base_template_bloc/features/data/models/post_model.dart';
import 'package:base_template_bloc/features/data/models/user_model.dart';

abstract class HomeRepo {
  Future<List<Post>> fetchPosts();
  Future<List<User>> fetchUsers();
}
