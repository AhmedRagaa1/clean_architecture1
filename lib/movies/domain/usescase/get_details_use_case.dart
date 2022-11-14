import 'package:clean_architecture1/core/base_use_case/base_use_case.dart';
import 'package:clean_architecture1/core/error/failure.dart';
import 'package:clean_architecture1/movies/domain/baserepository/movie_base_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entites/movie_details.dart';

class GetDetailsUseCase extends BaseUseCase<MovieDetails , MovieDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;
  GetDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async
  {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}


class MovieDetailsParameters extends Equatable
{
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}