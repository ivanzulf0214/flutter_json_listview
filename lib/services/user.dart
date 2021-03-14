import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class User {
  static Future<List<UserModel>> getAll() async {
    var url = "https://jsonplaceholder.typicode.com/users";

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<UserModel> users = userModelFromJson(response.body);
        return users;
      } else {
        return List<UserModel>();
      }
    } catch (e) {
      return List<UserModel>();
    }
  }
}
