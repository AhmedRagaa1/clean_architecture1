part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.detailsRequestState = RequestState.loading,
    this.movieDetailsMessage= '',
    this.recommendation = const [],
    this.recommendationRequestState = RequestState.loading,
    this.movieRecommendationMessage= '',

  });

  final MovieDetails? movieDetails;
  final RequestState detailsRequestState;
  final String movieDetailsMessage;
  final List<RecommendationMovie> recommendation;
  final RequestState recommendationRequestState;
  final String movieRecommendationMessage;

  MovieDetailsState copyWith({
     MovieDetails? movieDetails,
     RequestState? detailsRequestState,
     String? movieDetailsMessage,
    List<RecommendationMovie>? recommendation,
    RequestState? recommendationRequestState,
    String? movieRecommendationMessage,
  })
{
return MovieDetailsState
  (
  movieDetails: movieDetails ?? this.movieDetails,
  detailsRequestState: detailsRequestState ?? this.detailsRequestState,
  movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
  recommendation: recommendation ?? this.recommendation,
  recommendationRequestState: recommendationRequestState ?? this.recommendationRequestState,
  movieRecommendationMessage: movieRecommendationMessage ?? this.movieRecommendationMessage,
);
}

  @override
  List<Object?> get props =>
      [
        movieDetails,
        detailsRequestState,
        movieDetailsMessage,
        recommendation,
        recommendationRequestState,
        movieRecommendationMessage,

      ];
}
