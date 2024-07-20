import 'package:base_template_bloc/features/presentation/blocs/dashboard/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  void setTab(DashboardTab tab) => emit(DashboardState(tab: tab));
}
