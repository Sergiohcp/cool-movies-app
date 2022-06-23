import 'package:coolmovies/controllers/movies_controller.dart';
import 'package:coolmovies/models/create_review.dart';
import 'package:coolmovies/models/update_review.dart';
import 'package:coolmovies/repositories/reviews_repository.dart';
import 'package:get/get.dart';

class ReviewsController {
  final ReviewsRepository reviewsRepository;
  var _isReviewsLoading = false.obs;

  ReviewsController({required this.reviewsRepository});

  bool get isReviewsLoading => _isReviewsLoading.value;

  void setReviewsLoading(bool value) => _isReviewsLoading.value = value;

  Future createReview(CreateReview createReview) async {
    try {
      setReviewsLoading(true);
      await this.reviewsRepository.createReview(createReview);
      final moviesController = Get.find<MoviesController>();
      await moviesController.allMovies();
      moviesController.chooseMovie(createReview.movieId);
      Get.back();
    } finally {
      setReviewsLoading(false);
    }
  }

  Future updateReview(UpdateReview updateReview) async {
    try {
      setReviewsLoading(true);
      await this.reviewsRepository.updateReview(updateReview);
      final moviesController = Get.find<MoviesController>();
      await moviesController.allMovies();
      moviesController.chooseMovie(updateReview.movieId);
      Get.back();
    } finally {
      setReviewsLoading(false);
    }
  }
}
