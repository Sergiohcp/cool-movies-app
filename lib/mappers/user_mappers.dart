Map<String, dynamic> createUserMapper(Map<String, dynamic> map) {
  return {
    'id': map['createUser']['user']['id'],
    'name': map['createUser']['user']['name']
  };
}

Map<String, dynamic> currentUserMapper(
    Map<String, dynamic> map, String? userId) {
  final currentUser =
      map['allUsers']['nodes'].firstWhere((item) => item['id'] == userId);
  return {
    'id': currentUser['id'],
    'name': currentUser['name'],
  };
}
