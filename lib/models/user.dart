class User {
  int id;
  String name;

  User({
    this.id = 0,
    this.name = '',
  });

  factory User.createUser(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }
}
