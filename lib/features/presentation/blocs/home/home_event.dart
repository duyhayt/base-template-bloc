import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeFetchEvent extends HomeEvent {
  const HomeFetchEvent();
}
