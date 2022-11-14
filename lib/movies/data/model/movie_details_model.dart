import 'package:clean_architecture1/movies/data/model/genres_model.dart';
import 'package:clean_architecture1/movies/domain/entites/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.genres,
    required super.overview,
    required super.title,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
        overview: json["overview"],
        title: json["title"],
        releaseDate: json["release_date"],
        runtime: json["runtime"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
