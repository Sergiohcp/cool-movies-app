import 'package:coolmovies/mappers/movies_mapper.dart';
import 'package:coolmovies/models/list_movie.dart';
import 'package:coolmovies/models/movie.dart';
import 'package:coolmovies/repositories/movies_repository.dart';
import 'package:get/get.dart';

class MoviesController {
  final MoviesRepository moviesRepository;
  final _movies = [].obs;
  final _selectedMovie =
      Movie(id: '', imgUrl: '', title: '', releaseDate: '', reviews: []).obs;
  var _isMoviesLoading = false.obs;

  MoviesController({required this.moviesRepository});

  List<Movie> get movies => _movies.value as List<Movie>;
  Movie get selectedMovie => _selectedMovie.value as Movie;
  bool get isMoviesLoading => _isMoviesLoading.value;

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

  chooseMovie(String id) {
    print('ID: $id');
    final movieFound = this._movies.firstWhere((item) => item.id == id);
    this._selectedMovie.value = movieFound;
  }
}
