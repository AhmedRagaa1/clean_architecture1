class ApiConstance
{
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "c01fd46b4212316ceb317fef559c35a8";

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static  String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";
  static  String movieRecommendationPath(int id) => "$baseUrl/movie/$id/recommendations?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
}

//https://api.themoviedb.org/3/movie/now_playing?api_key=c01fd46b4212316ceb317fef559c35a8
//https://api.themoviedb.org/3/movie/436270?api_key=c01fd46b4212316ceb317fef559c35a8
// https://api.themoviedb.org/3/movie/436270/recommendations?api_key=c01fd46b4212316ceb317fef559c35a8