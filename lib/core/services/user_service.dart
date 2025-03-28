import 'dart:convert';

import 'package:test_app/core/constants/api_url.dart';
import 'package:test_app/core/errors/http_error_handler.dart';
import 'package:test_app/core/errors/user_exception.dart';
import 'package:test_app/data/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(getUsersUrl));

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final body = jsonDecode(response.body) as List;
      if (response.body.isEmpty) {
        throw UserException('No data found');
      }
      return body.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
