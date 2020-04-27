import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_flutter/views/principal_page.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inspiration | Nubank Design',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.dark
      ),
      home: new PrincipalPage(),
    );
  }
}
