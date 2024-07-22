import 'package:equatable/equatable.dart';

enum AppStatus { initial, loading, success, failure }

class AppState extends Equatable {
  final String token;
  final AppStatus status;
  const AppState({this.token = '', this.status = AppStatus.initial});

  AppState copyWith({String? token, AppStatus? status}) {
    return AppState(token: token ?? this.token, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [token, status];
}
