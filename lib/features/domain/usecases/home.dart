import 'package:base_template_bloc/features/data/models/post_model.dart';
import 'package:base_template_bloc/features/data/models/user_model.dart';
import 'package:base_template_bloc/features/domain/repositories/home_repo.dart';

class HomeUseCase {
  final HomeRepo _homeRepo;
  HomeUseCase(this._homeRepo);

  Future<List<Post>> fetchPosts() async {
    return await _homeRepo.fetchPosts();
  }

  Future<List<User>> fetchUsers() async {
    return await _homeRepo.fetchUsers();
  }
}
