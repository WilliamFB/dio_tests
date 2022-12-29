import '../model/user.dart';
import '../repository/user_repository.dart';

class HomeController {
  final UserRepository _userRepository;

  HomeController({required userRepository}) : _userRepository = userRepository;

  Future<List<User>> findAllUsers() => _userRepository.findAllUsers();
}
