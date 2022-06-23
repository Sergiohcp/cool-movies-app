class UpdateReview {
  String nodeId;
  String movieId;
  String userReviewerId;
  String title;
  String body;
  int rating;

  UpdateReview(
      {this.nodeId = '',
      this.movieId = '',
      this.userReviewerId = '',
      this.title = '',
      this.body = '',
      this.rating = 0});

  factory UpdateReview.updateReview(Map<String, dynamic> map) {
    return UpdateReview(
      nodeId: map['nodeId'],
      movieId: map['movieId'],
      userReviewerId: map['userReviewerId'],
      title: map['title'],
      body: map['body'],
      rating: map['rating'],
    );
  }
}
