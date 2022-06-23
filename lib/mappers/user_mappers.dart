Map<String, dynamic> createUserMapper(Map<String, dynamic> map) {
  return {
    'id': map['data']['createUser']['id'],
    'name': map['data']['createUser']['id']
  };
}
