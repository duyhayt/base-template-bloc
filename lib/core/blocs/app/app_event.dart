import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppFetchTokenEvent extends AppEvent {
  const AppFetchTokenEvent();

  @override
  List<Object?> get props => [];
}
