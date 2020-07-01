import 'package:flutter/material.dart';
import 'package:test_uis/pages/app.dart';
import 'package:test_uis/routes/routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String _title = 'Flutter Widget test';

  @override
  Widget build(BuildContext context) {  

    return MaterialApp(
      title: _title,
      routes: AppRoute.routes,
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: _title),
      home: App(),
    );
  }
}


