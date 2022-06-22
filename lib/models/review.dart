class Review {
  String userName;
  String title;
  String body;
  int rating;

  Review({
    required this.userName,
    required this.title,
    required this.body,
    required this.rating,
  });

  factory Review.createReview(Map<String, dynamic> map) {
    return Review(
        userName: map['userName'],
        title: map['title'],
        body: map['body'],
        rating: map['rating']);
  }
}
