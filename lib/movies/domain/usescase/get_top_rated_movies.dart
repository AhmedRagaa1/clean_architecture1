import 'package:clean_architecture1/core/error/failure.dart';
import 'package:clean_architecture1/movies/domain/entites/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../baserepository/movie_base_repository.dart';

class GetTopRatedMovieUseCase extends BaseUseCase<List<Movie> , NoParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMovieUseCase(this.baseMoviesRepository);


  @override
  Future<Either< Failure,List<Movie> >> call(NoParameters parameters) async
  {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}