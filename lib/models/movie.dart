import 'package:coolmovies/models/review.dart';

class Movie {
  String id;
  String imgUrl;
  String title;
  String releaseDate;
  List<Review> reviews;

  Movie({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.releaseDate,
    required this.reviews,
  });

  factory Movie.createMovie(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      imgUrl: map['imgUrl'],
      title: map['title'],
      releaseDate: map['releaseDate'],
      reviews: List<Review>.from(
          map['reviews']?.map((item) => Review.createReview(item))),
    );
  }
}
