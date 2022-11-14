import 'package:clean_architecture1/movies/data/datasource/movie_remote_data_source.dart';
import 'package:clean_architecture1/movies/domain/entites/movie.dart';
import 'package:clean_architecture1/movies/domain/entites/movie_details.dart';
import 'package:clean_architecture1/movies/domain/entites/recommendation.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_details_use_case.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_recommendation_movie_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository
{

  Future<Either< Failure,List<Movie> >> getNowPlayingMovies();

  Future<Either< Failure,List<Movie> >> getPopularMovies();

  Future<Either< Failure,List<Movie> >> getTopRatedMovies();

  Future<Either< Failure,MovieDetails >> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either< Failure,List<RecommendationMovie> >> getMovieRecommendation(MovieRecommendationParameters parameters);

}