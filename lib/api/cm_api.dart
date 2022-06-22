import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CMApi {
  static String get graphqlUrl => dotenv.env['GRAPHQL_URL'] as String;

  static HttpLink httpLink = HttpLink(graphqlUrl);

  static GraphQLClient get client => GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      );
}
