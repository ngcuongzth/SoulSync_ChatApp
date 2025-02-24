import 'package:soul_app/features.auth/domain/repositories/auth_respository.dart';
import 'package:soul_app/features.auth/domain/entities/user_entity.dart';

class LoginUseCase {
  final AuthRespository repository;

  LoginUseCase({required this.repository});

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
