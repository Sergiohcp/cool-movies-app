import 'package:graphql_flutter/graphql_flutter.dart';

class UserQueries {
  static dynamic get currentUser => gql("""
    query QueryRoot {
      currentUser {
        id
        name
      }
    }
  """);
}
