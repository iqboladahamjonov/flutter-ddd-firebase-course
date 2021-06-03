import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd_course/application/auth/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:notes_firebase_ddd_course/presentation/routes/router.gr.dart';
import 'package:notes_firebase_ddd_course/presentation/sign_in/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //BlocListener is useful for doind thing which basically cant happen during build, like navigation cant happen after build finishes
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            print('I am Authentificated');
          },
          unauthenticated: (_) => context.pushRoute(const SignInRoute()),
        );
      },
      child: const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
