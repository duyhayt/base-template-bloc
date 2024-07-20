import 'package:base_template_bloc/features/data/repositories/home_repo_impl.dart';
import 'package:base_template_bloc/features/data/repositories/login_repo_impl.dart';
import 'package:base_template_bloc/features/domain/repositories/home_repo.dart';
import 'package:base_template_bloc/features/domain/repositories/login_repo.dart';
import 'package:base_template_bloc/features/domain/usecases/home.dart';
import 'package:base_template_bloc/features/domain/usecases/login.dart';
import 'package:base_template_bloc/features/presentation/blocs/app/app_bloc.dart';
import 'package:base_template_bloc/features/presentation/blocs/dashboard/dashboard_cubit.dart';
import 'package:base_template_bloc/features/presentation/blocs/home/home_bloc.dart';
import 'package:base_template_bloc/features/presentation/blocs/login/login_bloc.dart';
import 'package:base_template_bloc/l10n/languages/language_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio()); // Tồn tại suốt trong vòng đời của ứng dụng

  // Repository
  sl.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());
  sl.registerLazySingleton<PostRepo>(() => PostRepoImpl());

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => PostUseCase(sl()));

  // Blocs
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => AppBloc());
  sl.registerFactory(() => ServiceBloc());

  //Cubits
  sl.registerFactory(() => DashboardCubit());
}
