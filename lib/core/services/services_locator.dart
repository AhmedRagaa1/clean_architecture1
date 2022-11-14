import 'package:clean_architecture1/movies/data/datasource/movie_remote_data_source.dart';
import 'package:clean_architecture1/movies/data/repository/movie_remote_repository.dart';
import 'package:clean_architecture1/movies/domain/baserepository/movie_base_repository.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_now_playing_movies.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_popular_movies.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_top_rated_movies.dart';
import 'package:clean_architecture1/movies/presentation/controller/movie_details_bloc.dart';
import 'package:clean_architecture1/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movies/domain/usescase/get_details_use_case.dart';
import '../../movies/domain/usescase/get_recommendation_movie_use_case.dart';

final sl = GetIt.instance;
class ServicesLocator
{
  void init ()
  {
    ////// Bloc
    sl.registerFactory(
            () =>MoviesBloc(sl() ,sl() ,sl()) );
    sl.registerFactory(() => MovieDetailsBloc(sl() , sl()));

    ////// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetDetailsUseCase(sl()));
    sl.registerLazySingleton(() => MovieRecommendationUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
            () => MovieRemoteRepository(sl()),
    );

    ///// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource(),
    );
  }
}