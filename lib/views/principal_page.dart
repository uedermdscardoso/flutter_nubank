
import 'package:flutter/material.dart';
import 'package:nubank_flutter/widgets/my_dots.dart';
import 'package:nubank_flutter/widgets/page_view_app.dart';
import 'package:nubank_flutter/widgets/principal_page_bar.dart';

class PrincipalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PrincipalPageState();
  }
}

class PrincipalPageState extends State<PrincipalPage> {

  bool _showMenu;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

    double _screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      backgroundColor: Colors.purple[800],
      body: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          PrincipalPageBar(
            showMenu: _showMenu,
            onTap: () => {
              this.setState(() {
                _showMenu = !_showMenu;
              })
            },
          ),
          PageViewApp(
              top: _screenHeight * .24,
              onChanged: (index){
                setState(() {
                  _currentIndex = index; //Recebe índice atual
                });
              },
          ),
          Positioned( //Posicionar
            top: _screenHeight * .70,
            child: MyDots(
              currentIndex: _currentIndex
            )
          )
        ],
      )
    );
  }
}