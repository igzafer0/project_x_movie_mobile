import 'package:core/core.dart';
import 'package:genre/data/impl/genre_repository_impl.dart';
import 'package:genre/data/repository/genre_repository.dart';
import 'package:genre/data/source/genre_remote_data_source.dart';
import 'package:genre/data/usecase/genre_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/data/impl/movie_repository_impl.dart';
import 'package:movie/data/repository/movie_repository.dart';
import 'package:movie/data/source/movie_remote_data_source.dart';
import 'package:movie/data/usecase/movie_usecase.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_route.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_service.dart';

final locator = GetIt.instance;

void init() {
  locator.registerSingleton(NavigationRoute());
  locator.registerSingleton(NavigationService());
  locator.registerLazySingleton(() => RemoteClient());

  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(remote: locator()),
  );
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(locator()),
  );
  locator.registerLazySingleton(() => MovieUseCase(locator()));

  locator.registerLazySingleton<GenreRemoteDataSource>(
    () => GenreRemoteDataSourceImpl(remote: locator()),
  );
  locator.registerLazySingleton<GenreRepository>(
    () => GenreRepositoryImpl(locator()),
  );
  locator.registerLazySingleton(() => GenreUseCase(locator()));

  // locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());
  // locator.registerLazySingleton<MovieRemoteDataSource>(
  //     () => MovieRemoteDataSourceImpl());

  // locator.registerLazySingleton<GenreRepository>(() => GenreRepositoryImpl());
  // locator.registerLazySingleton<GenreRemoteDataSource>(
  //     () => GenreRemoteDataSourceImpl());
}
