import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';
import 'presentation/core/app_widget.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //this will invoke the generated initGetIt method, which simply registers every possible dependency under the app
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
