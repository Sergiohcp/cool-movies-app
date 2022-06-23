import 'package:coolmovies/models/movie.dart';

class ListMovie {
  static createListMovie(List<Map<String, dynamic>> items) {
    return List<Movie>.from(items.map((item) => Movie.createMovie(item)));
  }
}
