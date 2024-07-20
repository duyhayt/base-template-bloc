import 'package:equatable/equatable.dart';

enum DashboardTab { home, news, settings }

final class DashboardState extends Equatable {
  final DashboardTab tab;

  const DashboardState({
    this.tab = DashboardTab.home,
  });

  @override
  List<Object?> get props => [tab];
}
