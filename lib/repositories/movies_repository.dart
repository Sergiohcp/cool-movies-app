import 'package:coolmovies/api/cm_api.dart';
import 'package:coolmovies/graphql/movies/movies_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MoviesRepository {
  final CMApi cmApi;

  MoviesRepository({required this.cmApi});

  Future allMovies() {
    return this
        .cmApi
        .client
        .query(QueryOptions(document: MoviesQueries.allMovies));
  }
}
