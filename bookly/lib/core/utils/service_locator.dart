import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/image_loader_service.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<ImageLoaderService>(() => CorsProxyImageLoader());
  getIt.registerLazySingleton<HomeRepoImplementation>(
    () => HomeRepoImplementation(
        getIt<ApiService>(), getIt<ImageLoaderService>()),
  );
}
