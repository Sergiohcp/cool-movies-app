import 'package:graphql_flutter/graphql_flutter.dart';

class UserMutations {
  static dynamic get createUser => gql("""
    mutation MutationRoot (\$input: CreateUserInput!) {
      createUser(input: \$input) {
        user {
          id
          name
        }
      }
    }
  """);
}
