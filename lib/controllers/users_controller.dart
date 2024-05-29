
import '../models/users_model.dart';
import '../services/users_service.dart';

class UsersController {
  final usersHttpService = UsersHttpService();
  Future<List<User>> getUsers() async {
    List<User> users =
    await usersHttpService.getUsersHttp();
    return users;
  }
}
