import 'package:clean_architecture1/core/base_use_case/base_use_case.dart';
import 'package:clean_architecture1/movies/domain/baserepository/movie_base_repository.dart';
import 'package:clean_architecture1/movies/domain/entites/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMovieUseCase extends BaseUseCase<List<Movie> , NoParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async
  {
    return await baseMoviesRepository.getNowPlayingMovies();

  }
}

