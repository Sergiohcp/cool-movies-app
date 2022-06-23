class User {
  String id;
  String name;

  User({
    this.id = '',
    this.name = '',
  });

  factory User.createUser(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
