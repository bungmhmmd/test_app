import 'package:test_app/core/errors/user_exception.dart';
import 'package:test_app/core/services/user_service.dart';
import 'package:test_app/data/models/user.dart';

class UserRepository {
  final UserService userService;

  UserRepository({required this.userService});

  Future<List<User>> getUsers() async {
    try {
      return await userService.getUsers();
    } on UserException catch (e) {
      throw UserException(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
