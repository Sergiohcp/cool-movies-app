import 'package:cached_network_image/cached_network_image.dart';
import 'package:coolmovies/controllers/movies_controller.dart';
import 'package:coolmovies/controllers/user_controller.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/models/review.dart';
import 'package:coolmovies/pages/movieDetails/widgets/list_review_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final moviesController = Get.find<MoviesController>();

    return Scaffold(
      backgroundColor: CMColors.blueLight,
      appBar: AppBar(
        backgroundColor: CMColors.primary,
        title: Text(
          'Detail',
          style: CMTextStyles.appBar,
          textAlign: TextAlign.start,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Center(
              child: CachedNetworkImage(
                height: 200,
                fit: BoxFit.fill,
                imageUrl: moviesController.selectedMovie.imgUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              moviesController.selectedMovie.title,
              style: CMTextStyles.movieDetailsTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Launched on ${DateFormat.yMMMd().format(DateTime.parse(moviesController.selectedMovie.releaseDate))}",
              style: CMTextStyles.movieDetailsReleaseDate,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Reviews",
                  style: CMTextStyles.movieDetailsReviews,
                ),
                IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Get.toNamed('/CreateOrEditReview', arguments: {
                        'movie': moviesController.selectedMovie,
                        'review': Review(
                            id: '',
                            userId: '',
                            userName: '',
                            title: '',
                            body: '',
                            rating: 1)
                      });
                    },
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: CMColors.white,
                    ))
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: moviesController.selectedMovie.reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      final isFromUser = moviesController
                              .selectedMovie.reviews[index].userId ==
                          userController.user.id;
                      return ListReviewItem(
                        review: moviesController.selectedMovie.reviews[index],
                        showEdit: isFromUser,
                        onEdit: () {
                          Get.toNamed('/CreateOrEditReview', arguments: {
                            'movie': moviesController.selectedMovie,
                            'review':
                                moviesController.selectedMovie.reviews[index]
                          });
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
