import 'package:clean_architecture1/core/error/exception.dart';
import 'package:clean_architecture1/core/network/api_constant.dart';
import 'package:clean_architecture1/core/network/error_message_model.dart';
import 'package:clean_architecture1/movies/data/model/Recommendation_movie_model.dart';
import 'package:clean_architecture1/movies/data/model/movie_details_model.dart';
import 'package:clean_architecture1/movies/data/model/movies_model.dart';
import 'package:clean_architecture1/movies/domain/entites/movie_details.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_details_use_case.dart';
import 'package:dio/dio.dart';

import '../../domain/entites/recommendation.dart';
import '../../domain/usescase/get_recommendation_movie_use_case.dart';

abstract class BaseMovieRemoteDataSource
{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getDetailsMovies(MovieDetailsParameters parameters);
  Future<List<RecommendationMovie>> getRecommendationMovies(MovieRecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource
{

  @override
  Future<List<MovieModel>> getNowPlayingMovies()  async
  {
    final response =  await Dio().get(ApiConstance.nowPlayingMoviesPath);
    print(response);

    if(response.statusCode == 200)
    {
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async
  {
    final response =  await Dio().get(ApiConstance.popularMoviesPath);

    if(response.statusCode == 200)
    {
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }

  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async
  {
    final response =  await Dio().get(ApiConstance.topRatedMoviesPath);

    if(response.statusCode == 200)
    {
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

  @override
  Future<MovieDetailsModel> getDetailsMovies(MovieDetailsParameters parameters) async
  {
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if(response.statusCode == 200)
    {
      return MovieDetailsModel.fromJson(response.data);
    }else
    {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationMovie>> getRecommendationMovies(MovieRecommendationParameters parameters) async
  {
    {
      final response =  await Dio().get(ApiConstance.movieRecommendationPath(parameters.id));

      if(response.statusCode == 200)
      {
        return List<RecommendationModel>.from((response.data["results"]as List).map((e) => RecommendationModel.fromJson(e)));
      }else
      {
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
      }
    }

  }
}