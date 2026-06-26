import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_consumer.dart';
import 'package:flutter_advanced/core/networking/dio_consumer.dart';
import 'package:flutter_advanced/core/networking/dio_factory.dart';
import 'package:flutter_advanced/core/networking/internet_checker/network_info.dart';
import 'package:flutter_advanced/core/networking/internet_checker/network_info_impl.dart';
import 'package:flutter_advanced/features/login/data/repo/login_repo.dart';
import 'package:flutter_advanced/features/login/data/repo/login_repo_impl.dart';
import 'package:flutter_advanced/features/login/presentation/cubit/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/register/data/repo/register_repo.dart';
import 'package:flutter_advanced/features/register/data/repo/register_repo_impl.dart';
import 'package:flutter_advanced/features/register/presentation/cubit/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final sl = GetIt.instance;

Future<void> initiateGetIt() async {
  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: sl<Dio>(), networkInfo: sl<NetworkInfo>()),
  );
  sl.registerLazySingleton<Dio>(() => DioFactory.createDio());
  // sl.registerLazySingleton<ApiInterceptor>(() => ApiInterceptor());
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl<InternetConnection>()),
  );

  /// login
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: sl<LoginRepo>()));

  /// register
  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImpl(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(registerRepo: sl<RegisterRepo>()),
  );
}
