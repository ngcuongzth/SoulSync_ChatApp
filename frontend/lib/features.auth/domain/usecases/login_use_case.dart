import 'package:soul_app/features.auth/domain/repositories/auth_respository.dart';
import 'package:soul_app/features.auth/domain/entities/user_entity.dart';

class LoginUseCase {
  final AuthRespository respository;

  LoginUseCase({required this.respository});

  Future<UserEntity> call(String email, String password) {
    return respository.login(email, password);
  }
}
