import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_flutter/splash/splash_page.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.purple[800]
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
      home: new SplashPage(),
    );
  }
}

//para rodar como release em um dispositivo
//flutter run -d --release <nome-do-dispositivo>
//flutter -d    mostra todos os dispositivos disponíveis
