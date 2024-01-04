import 'package:get_it/get_it.dart';
import 'package:novandi/core_module/bloc/get_ip_bloc/get_ip_bloc.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/data/remote/core_remote_data_source.dart';
import 'package:novandi/core_module/data/repositories/core_repository_impl.dart';
import 'package:novandi/core_module/domain/repositories/core_repository.dart';
import 'package:novandi/core_module/domain/usecases/core_usecase.dart';
import 'package:novandi/core_module/routes/page_routes.dart';
import 'package:novandi/home_module/data/remote/home_remote_data_source.dart';
import 'package:novandi/home_module/data/repositories/home_repository_impl.dart';
import 'package:novandi/home_module/domain/repositories/home_repository.dart';
import 'package:novandi/home_module/domain/usecases/home_usecase.dart';
import 'package:novandi/home_module/presentation/bloc/home_bottom_navbar_bloc/home_bottom_navbar_bloc.dart';
import 'package:novandi/home_module/presentation/bloc/home_list_bloc/home_list_bloc.dart';
import 'package:novandi/home_module/presentation/bloc/profile_bloc/profile_bloc.dart';

GetIt locator = GetIt.instance;

void initInjector() {
  locator.registerLazySingleton(() => PageRoutes());
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  ///BLOC
  locator.registerFactory(() => GetIpBloc(locator()));
  locator.registerFactory(() => HomeBottomNavbarBloc());
  locator.registerFactory(() => ProfileBloc());
  locator.registerFactory(() => HomeListBloc(locator()));

  ///USECASES
  locator.registerLazySingleton(() => CoreUsecase(locator()));
  locator.registerLazySingleton(() => HomeUsecase(locator()));

  ///REPOSITORIES
  locator.registerLazySingleton<CoreRepository>(
    () => CoreRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(locator()),
  );

  ///REMOTEDATASOURCES
  locator.registerLazySingleton<CoreRemoteDataSource>(
    () => CoreRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
