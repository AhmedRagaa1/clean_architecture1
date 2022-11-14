import 'dart:async';

import 'package:clean_architecture1/core/utils/enums.dart';
import 'package:clean_architecture1/movies/domain/entites/movie_details.dart';
import 'package:clean_architecture1/movies/domain/entites/recommendation.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_details_use_case.dart';
import 'package:clean_architecture1/movies/domain/usescase/get_recommendation_movie_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.detailsUseCase, this.movieRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetDetailsUseCase detailsUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await detailsUseCase(MovieDetailsParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
              detailsRequestState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetails: r,
              detailsRequestState: RequestState.loaded,
            )));
  }



  final MovieRecommendationUseCase movieRecommendationUseCase;

  FutureOr<void> _getMovieRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async
  {
    final result =
    await movieRecommendationUseCase(MovieRecommendationParameters(id: event.id));

    result.fold(
            (l) => emit(state.copyWith(
          recommendationRequestState: RequestState.error,
          movieRecommendationMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          recommendation: r,
          recommendationRequestState: RequestState.loaded,
        )));
  }
}
