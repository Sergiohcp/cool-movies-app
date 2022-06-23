import 'package:coolmovies/api/cm_api.dart';
import 'package:coolmovies/graphql/reviews/reviews_mutations.dart';
import 'package:coolmovies/models/create_review.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReviewsRepository {
  final CMApi cmApi;

  ReviewsRepository({required this.cmApi});

  Future createReview(CreateReview map) {
    return this.cmApi.client.mutate(MutationOptions(
            document: ReviewsMutations.createReview,
            variables: {
              'input': {
                'movieReview': {
                  'movieId': map.movieId,
                  'userReviewerId': map.userReviewerId,
                  'title': map.title,
                  'body': map.body,
                  'rating': map.rating,
                }
              },
            }));
  }
}
