import 'package:coolmovies/mappers/movies_mapper.dart';
import 'package:coolmovies/models/list_movie.dart';
import 'package:coolmovies/models/movie.dart';
import 'package:coolmovies/repositories/movies_repository.dart';
import 'package:get/get.dart';

class MoviesController {
  final MoviesRepository moviesRepository;
  final _movies = [].obs;
  var _isMoviesLoading = false.obs;

  MoviesController({required this.moviesRepository});

  bool get isMoviesLoading => _isMoviesLoading.value;
  List<Movie> get movies => _movies.value as List<Movie>;

  void setMoviesLoading(bool value) => _isMoviesLoading.value = value;
  void setMovies(List<Movie> value) => _movies.value = value;

  Future allMovies() async {
    try {
      setMoviesLoading(true);
      var response = await this.moviesRepository.allMovies();
      final moviesMapped = allMoviesMapper(response.data);
      setMovies(ListMovie.createListMovie(moviesMapped));
    } finally {
      setMoviesLoading(false);
    }
  }
}
