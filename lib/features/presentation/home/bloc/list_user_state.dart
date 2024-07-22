import 'package:base_template_bloc/features/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class ListUserState extends Equatable {
  const ListUserState();
  @override
  List<Object?> get props => [];
}

class ListUserLoading extends ListUserState {
  const ListUserLoading();
  @override
  List<Object> get props => [];
}

class ListUserLoaded extends ListUserState {
  final List<User> users;
  const ListUserLoaded(this.users);
  @override
  List<Object> get props => [users];
}

class ListUserFailure extends ListUserState {
  final String message;
  const ListUserFailure(this.message);
  @override
  List<Object> get props => [message];
}
