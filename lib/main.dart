// import 'package:bukin_app/redux/stores/bukin-state.dart';
import 'package:bukin_app/pages/book-detail/components/book-detail-page.dart';
import 'package:bukin_app/pages/home/components/home-page.dart';
import 'package:flutter/material.dart';
// import 'package:redux/redux.dart';

void main() {
  // final store = Store<BukinState>();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => HomePage(),
        '/book-detail': (context) => BookDetailPage()
      },
      theme: ThemeData(
          primaryTextTheme: TextTheme(body1: TextStyle(color: Color(0xff54492E))),
          backgroundColor: Color(0xffEAF2E3),
          accentColor: Color(0xff709F68),
          primaryColor: Color(0xffE9CB83)),
      home: HomePage(),
    );
  }
}
