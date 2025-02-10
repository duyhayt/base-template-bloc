import 'package:base_template_bloc/core/blocs/app/app_bloc.dart';
import 'package:base_template_bloc/core/blocs/service/service_bloc.dart';
import 'package:base_template_bloc/features/data/repositories/home_repo_impl.dart';
import 'package:base_template_bloc/features/data/repositories/login_repo_impl.dart';
import 'package:base_template_bloc/features/domain/repositories/home_repo.dart';
import 'package:base_template_bloc/features/domain/repositories/login_repo.dart';
import 'package:base_template_bloc/features/domain/usecases/home.dart';
import 'package:base_template_bloc/features/domain/usecases/login.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_post_cubit.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_user_cubit.dart';
import 'package:base_template_bloc/features/presentation/login/bloc/login_bloc.dart';
import 'package:base_template_bloc/features/presentation/todo_list/bloc/todo_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio()); // Tồn tại suốt trong vòng đời của ứng dụng

  // Repository
  sl.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => HomeUseCase(sl()));

  // Blocs
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => AppBloc());
  sl.registerFactory(() => ServiceBloc());
  sl.registerFactory(() => TodoListBloc());

  /// Cubits
  // Home
  sl.registerFactory(() => ListPostCubit(sl()));
  sl.registerFactory(() => ListUserCubit(sl()));
}
