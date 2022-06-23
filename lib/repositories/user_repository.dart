import 'package:coolmovies/api/cm_api.dart';
import 'package:coolmovies/graphql/user/user_mutations.dart';
import 'package:coolmovies/graphql/user/user_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserRepository {
  final CMApi cmApi;

  UserRepository({required this.cmApi});

  Future currentUser(String name) {
    return this
        .cmApi
        .client
        .query(QueryOptions(document: UserQueries.currentUser));
  }

  Future createUser(String name) {
    return this
        .cmApi
        .client
        .mutate(MutationOptions(document: UserMutations.createUser));
  }
}
