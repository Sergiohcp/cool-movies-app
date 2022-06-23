import 'package:coolmovies/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User tests', () {
    test('should return a customer instance with name equal Steve Jobs', () {
      final user = User.createUser({
        'id': '1234',
        'name': 'Steve Jobs',
      });

      expect(user.id, '1234');
      expect(user.name, 'Steve Jobs');
    });
  });
}
