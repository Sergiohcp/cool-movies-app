class CreateReview {
  String movieId;
  String userReviewerId;
  String title;
  String body;
  int rating;

  CreateReview({
    this.movieId = '',
    this.userReviewerId = '',
    this.title = '',
    this.body = '',
    this.rating = 0
  });

  factory CreateReview.createReview(Map<String, dynamic> map) {
    return CreateReview(
      movieId: map['movieId'],
      userReviewerId: map['userReviewerId'],
      title: map['title'],
      body: map['body'],
      rating: map['rating'],
    );
  }
}
