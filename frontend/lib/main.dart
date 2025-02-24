import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soul_app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:soul_app/features.auth/data/datasources/auth_remote_data_source.dart';
import 'package:soul_app/features.auth/data/repositories/auth_repository_impl.dart';
import 'package:soul_app/features.auth/domain/usecases/login_use_case.dart';
import 'package:soul_app/features.auth/domain/usecases/regiser_use_case.dart';
import 'package:soul_app/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:soul_app/features.auth/presentation/pages/login_page.dart';
import 'package:soul_app/features.auth/presentation/pages/register_page.dart';

void main() {
  final authRepository =
      AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSource());
  runApp(MyApp(
    authRepository: authRepository,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;
  const MyApp({super.key, required this.authRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthBloc(
                registerUseCase: RegisterUseCase(repository: authRepository),
                loginUseCase: LoginUseCase(repository: authRepository)))
      ],
      child: MaterialApp(
        title: 'SoulSync - Chat App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        // home: LoginPage(),
        home: RegisterPage(),
        routes: {
          "/login": (_) => LoginPage(),
          "/register": (_) => RegisterPage()
        },
      ),
    );
  }
}
