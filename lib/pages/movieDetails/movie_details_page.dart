import 'package:cached_network_image/cached_network_image.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/models/movie.dart';
import 'package:coolmovies/pages/movieDetails/widgets/list_review_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = Get.arguments;

    return Scaffold(
      backgroundColor: CMColors.blueLight,
      appBar: AppBar(
        backgroundColor: CMColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Center(
              child: CachedNetworkImage(
                height: 200,
                fit: BoxFit.fill,
                imageUrl: movie.imgUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              movie.title,
              style: CMTextStyles.movieDetailsTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Launched on ${movie.releaseDate}",
              style: CMTextStyles.movieDetailsReleaseDate,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Text(
                  "Reviews",
                  style: CMTextStyles.movieDetailsReviews,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: movie.reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListReviewItem(review: movie.reviews[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
