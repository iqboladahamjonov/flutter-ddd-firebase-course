import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';

void main() {
  //this will invoke the generated initGetIt method, which simply registers every possible dependency under the app
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
