// @dart=2.9
import 'package:crud_firebase/src/app/wellcome.dart';
// ignore: unused_import
import 'package:crud_firebase/view/testes/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splash_screen_view/SplashScreenView.dart'
    show SplashScreenView, TextType;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                strokeWidth: 10,
              ),
            );
          default:
            Widget example1 = SplashScreenView(
              home: Wellcome(),
              duration: 3000,
              imageSize: 200,
              text: "Tech Motors",
              imageSrc: "assets/logo1.png",
              backgroundColor: Color(0xFFE5E5E5),
              textType: TextType.TyperAnimatedText,
              textStyle: TextStyle(
                  color: Color(0xF513B5EB),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            );
            return MaterialApp(
              title: 'Tech Motors',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: example1,
            );
        }
      },
    );

    /* return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.tag,
      routes: {
        HomePage.tag: (context) => HomePage(),
      },
    ); */
  }
}
