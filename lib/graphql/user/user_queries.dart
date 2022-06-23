import 'package:graphql_flutter/graphql_flutter.dart';

class UserQueries {
  static dynamic get allUsers => gql("""
    query QueryRoot {
      allUsers {
        nodes {
          id
          name
        }
      }
    }
  """);
}
