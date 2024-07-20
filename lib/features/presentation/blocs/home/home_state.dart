import 'package:base_template_bloc/features/data/models/home_model.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final List<Post> posts;
  final HomeStatus status;

  const HomeState({
    this.posts = const <Post>[],
    this.status = HomeStatus.initial,
  });

  HomeState copyWith({List<Post>? posts, HomeStatus? status}) {
    return HomeState(posts: posts ?? this.posts, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [posts, status];
}
