import 'package:soul_app/features.auth/domain/repositories/auth_respository.dart';
import 'package:soul_app/features.auth/domain/entities/user_entity.dart';

class RegisterUseCase {
  final AuthRespository respository;

  RegisterUseCase({required this.respository});

  Future<UserEntity> call(String username, String email, String password) {
    return respository.register(username, email, password);
  }
}
