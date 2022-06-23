import 'package:coolmovies/mappers/user_mappers.dart';
import 'package:coolmovies/models/create_review.dart';
import 'package:coolmovies/repositories/reviews_repository.dart';
import 'package:get/get.dart';

class ReviewsController {
  final ReviewsRepository reviewsRepository;
  var _isReviewsLoading = false.obs;

  ReviewsController({required this.reviewsRepository});

  bool get isReviewsLoading => _isReviewsLoading.value;

  void setReviewsLoading(bool value) => _isReviewsLoading.value = value;

  Future createReview(CreateReview map) async {
    try {
      setReviewsLoading(true);
      var response = await this.reviewsRepository.createReview(map);
      final userMapped = createUserMapper(response.data);
      Get.back();
    } finally {
      setReviewsLoading(false);
    }
  }
}
