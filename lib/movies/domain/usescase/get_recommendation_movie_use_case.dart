import 'package:clean_architecture1/core/base_use_case/base_use_case.dart';
import 'package:clean_architecture1/core/error/failure.dart';
import 'package:clean_architecture1/movies/domain/baserepository/movie_base_repository.dart';
import 'package:clean_architecture1/movies/domain/entites/recommendation.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_details_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class MovieRecommendationUseCase extends BaseUseCase<List<RecommendationMovie> , MovieRecommendationParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  MovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationMovie>>> call(MovieRecommendationParameters parameters) async
  {
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }


}

class MovieRecommendationParameters extends Equatable
{
  final int id;

  const MovieRecommendationParameters({required this.id});



  @override
  List<Object?> get props => [id];
}
