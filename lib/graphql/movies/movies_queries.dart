import 'package:graphql_flutter/graphql_flutter.dart';

class MoviesQueries {
  static dynamic get allMovies => gql("""
    query QueryRoot {
      allMovies {
        edges {
          node {
            id
            imgUrl
            title
            releaseDate
            movieReviewsByMovieId {
              edges {
                node {
                  id
                  body
                  title
                  rating
                  userByUserReviewerId {
                    id
                    name
                  }
                }
              }
            }
          }
        }
      }
    }
  """);
}
