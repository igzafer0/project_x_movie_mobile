import 'package:get_it/get_it.dart';
import 'package:project_x_movie_mobile/config/data/remote_manager.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_route.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_service.dart';
import 'package:project_x_movie_mobile/data/repository/genre_repository_impl.dart';
import 'package:project_x_movie_mobile/data/repository/movie_repository_impl.dart';
import 'package:project_x_movie_mobile/data/source/remote/genre/genre_remote_data_soruce.dart';
import 'package:project_x_movie_mobile/data/source/remote/movie/movie_remote_data_source.dart';
import 'package:project_x_movie_mobile/domain/repository/genre/genre_repository.dart';
import 'package:project_x_movie_mobile/domain/repository/movie/movie_repository.dart';
import 'package:project_x_movie_mobile/domain/usecase/genre/genre_usecase.dart';
import 'package:project_x_movie_mobile/domain/usecase/movie/movie_usecase.dart';

final locator = GetIt.instance;

void init() {
  locator.registerSingleton(NavigationRoute());
  locator.registerSingleton(NavigationService());
  locator.registerLazySingleton(() => RemoteManager());
  locator.registerLazySingleton(() => MovieUseCase());
  locator.registerLazySingleton(() => GenreUseCase());

  locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl());

  locator.registerLazySingleton<GenreRepository>(() => GenreRepositoryImpl());
  locator.registerLazySingleton<GenreRemoteDataSource>(
      () => GenreRemoteDataSourceImpl());
}
