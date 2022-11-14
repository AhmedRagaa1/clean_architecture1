import 'package:clean_architecture1/core/error/exception.dart';
import 'package:clean_architecture1/core/error/failure.dart';
import 'package:clean_architecture1/movies/domain/baserepository/movie_base_repository.dart';
import 'package:clean_architecture1/movies/domain/entites/movie.dart';
import 'package:clean_architecture1/movies/domain/entites/movie_details.dart';
import 'package:clean_architecture1/movies/domain/entites/recommendation.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_details_use_case.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_recommendation_movie_use_case.dart';
import 'package:dartz/dartz.dart';

import '../datasource/movie_remote_data_source.dart';

class MovieRemoteRepository extends BaseMoviesRepository
{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRemoteRepository(this.baseMovieRemoteDataSource);


  @override
  Future<Either< Failure,List<Movie> >> getNowPlayingMovies() async
  {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try
    {
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either< Failure,List<Movie> >> getPopularMovies() async
  {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try
    {
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either< Failure,List<Movie> >> getTopRatedMovies() async
  {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try
    {
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async
  {
    final result = await baseMovieRemoteDataSource.getDetailsMovies(parameters);

    try
    {
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationMovie>>> getMovieRecommendation(MovieRecommendationParameters parameters) async
  {
    final result = await baseMovieRemoteDataSource.getRecommendationMovies(parameters);

    try
    {
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

}