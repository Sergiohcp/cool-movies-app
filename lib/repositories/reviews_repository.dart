import 'package:coolmovies/api/cm_api.dart';
import 'package:coolmovies/graphql/reviews/reviews_mutations.dart';
import 'package:coolmovies/models/create_review.dart';
import 'package:coolmovies/models/update_review.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ReviewsRepository {
  final CMApi cmApi;

  ReviewsRepository({required this.cmApi});

  Future createReview(CreateReview createReview) {
    return this.cmApi.client.mutate(MutationOptions(
            document: ReviewsMutations.createReview,
            variables: {
              'input': {
                'movieReview': {
                  'movieId': createReview.movieId,
                  'userReviewerId': createReview.userReviewerId,
                  'title': createReview.title,
                  'body': createReview.body,
                  'rating': createReview.rating,
                }
              },
            }));
  }

  Future updateReview(UpdateReview updateReview) {
    return this.cmApi.client.mutate(MutationOptions(
            document: ReviewsMutations.updateReview,
            variables: {
              'input': {
                'nodeId': updateReview.nodeId,
                'movieReviewPatch': {
                  'movieId': updateReview.movieId,
                  'userReviewerId': updateReview.userReviewerId,
                  'title': updateReview.title,
                  'body': updateReview.body,
                  'rating': updateReview.rating,
                }
              },
            }));
  }
}

/*
body: "", movieId: "", title: "", id: "", userReviewerId: ""
 */
