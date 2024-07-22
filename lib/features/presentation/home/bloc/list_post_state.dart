import 'package:base_template_bloc/features/data/models/post_model.dart';
import 'package:equatable/equatable.dart';

class ListPostState extends Equatable {
  const ListPostState();
  @override
  List<Object?> get props => [];
}

class ListPostLoading extends ListPostState {
  const ListPostLoading();
  @override
  List<Object> get props => [];
}

class ListPostLoaded extends ListPostState {
  final List<Post> posts;
  const ListPostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}

class ListPostFailure extends ListPostState {
  final String message;
  const ListPostFailure(this.message);
  @override
  List<Object> get props => [message];
}