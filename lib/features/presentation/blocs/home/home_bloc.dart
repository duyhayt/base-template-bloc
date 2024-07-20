import 'package:base_template_bloc/features/data/models/home_model.dart';
import 'package:base_template_bloc/features/domain/usecases/home.dart';
import 'package:base_template_bloc/features/presentation/blocs/home/home_event.dart';
import 'package:base_template_bloc/features/presentation/blocs/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostUseCase _postUseCase;

  HomeBloc(this._postUseCase) : super(const HomeState()) {
    on<HomeFetchEvent>(_onPostFetch);
    add(const HomeFetchEvent());
  }

  _onPostFetch(HomeFetchEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      List<Post> posts = await _postUseCase.fetchPosts();
      emit(state.copyWith(status: HomeStatus.success, posts: posts));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
