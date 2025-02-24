import 'package:soul_app/features.auth/domain/entities/user_entity.dart';

abstract class AuthRespository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String username, String email, String password);
}
