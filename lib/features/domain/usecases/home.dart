import 'package:base_template_bloc/core/usecase/usecase.dart';
import 'package:base_template_bloc/features/data/models/home_model.dart';
import 'package:base_template_bloc/features/domain/repositories/home_repo.dart';

class PostUseCase implements UseCase<bool, String> {
  final PostRepo _postRepo;
  PostUseCase(this._postRepo);

  Future<List<Post>> fetchPosts() {
    return _postRepo.fetchPosts();
  }

  @override
  Future<bool> call(String params) {
    throw UnimplementedError();
  }
}
