
import 'package:flutter/material.dart';
import 'package:nubank_flutter/views/principal_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    delay(); //Trocando em 2 segundos
  }

  Future<void> delay() async {
    return await Future.delayed(Duration(seconds: 2), (){
      //Aparece a tela de uma vez (com PageRouteBuilder)
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return PrincipalPage(); //Substituindo para a tela PrincipalPage
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Center(
        child: Image.asset(
            "assets/images/nubank-logo.png",
            height: 50,
            color: Colors.white
        ),
      ),
    );
  }
}
