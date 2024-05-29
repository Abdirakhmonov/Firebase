import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/users_model.dart';

class UsersHttpService {
  Future<List<User>> getUsersHttp() async {
    Uri url = Uri.parse(
        "https://api.escuelajs.co/api/v1/users");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Ma'lumot olishda hatolik bor");
    }
  }
}