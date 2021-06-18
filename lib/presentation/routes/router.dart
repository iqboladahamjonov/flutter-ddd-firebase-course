//it contains definition of routes
import 'package:auto_route/annotations.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:notes_firebase_ddd_course/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase_ddd_course/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: NotesOverviewPage),
  ],
)
class $Router {}
