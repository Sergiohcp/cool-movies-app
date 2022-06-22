import 'package:coolmovies/models/movie.dart';

class ListMovie {
  List<Movie> movies;

  ListMovie({
    required this.movies,
  });

  factory ListMovie.createListMovie(List<Map<String, dynamic>> items) {
    return ListMovie(
      movies: List<Movie>.from(items.map((item) => Movie.createMovie(item))),
    );
  }
}
