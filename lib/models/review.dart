class Review {
  String id;
  String userId;
  String userName;
  String title;
  String body;
  int rating;

  Review({
    required this.id,
    required this.userId,
    required this.userName,
    required this.title,
    required this.body,
    required this.rating,
  });

  factory Review.createReview(Map<String, dynamic> map) {
    return Review(
        id: map['id'],
        userId: map['userId'],
        userName: map['userName'],
        title: map['title'],
        body: map['body'],
        rating: map['rating']);
  }
}
