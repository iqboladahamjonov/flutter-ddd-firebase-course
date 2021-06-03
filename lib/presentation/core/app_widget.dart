import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd_course/application/auth/auth_bloc.dart';
import 'package:notes_firebase_ddd_course/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase_ddd_course/presentation/routes/router.gr.dart'
    as app_router;
import '../../injection.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  final _appRouter = app_router.Router();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()))
      ],
      child: MaterialApp(
        title: 'Notes',
        // home: SignInPage(),
        home: MaterialApp.router(
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate()),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green.shade800,
          accentColor: Colors.blueAccent,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
