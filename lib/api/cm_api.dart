import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CMApi {
  final graphqlUrl = dotenv.env['GRAPHQL_URL'] as String;

  GraphQLClient get client => graphqlClient();

  GraphQLClient graphqlClient() {
    final HttpLink httpLink = HttpLink(graphqlUrl);
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}

final cmApi = CMApi();
