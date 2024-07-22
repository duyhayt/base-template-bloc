import 'package:base_template_bloc/features/data/models/post_model.dart';
import 'package:base_template_bloc/features/domain/usecases/home.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit(this._homeUseCase) : super(const ListPostLoading());

  final HomeUseCase _homeUseCase;
  Future<void> fetchPosts() async {
    try {
      List<Post> posts = await _homeUseCase.fetchPosts();
      emit(ListPostLoaded(posts));
    } catch (e) {
      emit(ListPostFailure(e.toString()));
    }
  }
}
