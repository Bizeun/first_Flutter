class MoviesPopularModel {
  final String title, posterPath;
  final int id;

  MoviesPopularModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        posterPath = json['poster_path'],
        id = json['id'];
}
