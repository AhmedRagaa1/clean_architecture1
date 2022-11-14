import 'package:clean_architecture1/movies/domain/entites/recommendation.dart';

class RecommendationModel extends RecommendationMovie
{
  const RecommendationModel(
      {
         super.backdropPath,
        required super.id
      });

  factory RecommendationModel.fromJson(Map<String, dynamic> json)=>
      RecommendationModel(
      backdropPath: json['backdrop_path'] ?? '/y5Z0WesTjvn59jP6yo459eUsbli.jpg',
          id: json['id'],
      );
}