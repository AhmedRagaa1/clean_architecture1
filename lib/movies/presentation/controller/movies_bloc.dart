import 'dart:async';

import 'package:clean_architecture1/core/base_use_case/base_use_case.dart';
import 'package:clean_architecture1/core/utils/enums.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_now_playing_movies.dart';
import 'package:clean_architecture1/movies/presentation/controller/movies_events.dart';
import 'package:clean_architecture1/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usescase/get_popular_movies.dart';
import '../../domain/usescase/get_top_rated_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>
{
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMovieUseCase, this.getPopularMovieUseCase, this.getTopRatedMoviesUseCase) : super(const MoviesState())
  {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async
  {
    {
      final result = await getNowPlayingMovieUseCase(const NoParameters());
      result.fold(
              (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
              (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
    }
  }


  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async
  {
    {
      final result = await getPopularMovieUseCase(const NoParameters());

      result.fold(
            (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
            (r) => emit(state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        )),
      );
    }
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async
  {
    {
      final result = await getTopRatedMoviesUseCase(const NoParameters());

      result.fold(
            (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
            (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)),
      );
    }
  }
}