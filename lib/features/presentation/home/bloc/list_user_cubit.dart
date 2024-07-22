import 'package:base_template_bloc/features/data/models/user_model.dart';
import 'package:base_template_bloc/features/domain/usecases/home.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit(this._homeUseCase) : super(const ListUserLoading());
  final HomeUseCase _homeUseCase;

  Future<void> fetchUsers() async {
    try {
      List<User> users = await _homeUseCase.fetchUsers();
      emit(ListUserLoaded(users));
    } catch (e) {
      emit(ListUserFailure(e.toString()));
    }
  }
}
