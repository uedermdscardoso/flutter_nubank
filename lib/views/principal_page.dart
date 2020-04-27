
import 'package:flutter/material.dart';
import 'package:nubank_flutter/widgets/menu_app.dart';
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
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
    _yPosition = 0;
  }

  @override
  Widget build(BuildContext context) {

    double _screenHeight = MediaQuery.of(context).size.height;
    if(_yPosition == null) {
      _yPosition = _screenHeight * .24;
    }

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
                _yPosition = _showMenu ? _screenHeight * .75 : _screenHeight * .24; //Mudando a posição do quadro branco ao clicar na seta
              })
            },
          ),

          MenuApp(
            top: _screenHeight * .20,
            showMenu: _showMenu,
          ),

          PageViewApp( //Quadro branco
            top: _yPosition, //!_showMenu ? _screenHeight * .24 : _screenHeight * .75,
            showMenu: _showMenu,
            onChanged: (index){
              setState(() {
                _currentIndex = index; //Recebe índice atual
              });
            },
            onPanUpdate: (details){ //Pode arrastar o item ao clicar
              setState(() {
                double positionBottomLimit = _screenHeight * .75;
                double positionTopLimit = _screenHeight * .24;
                double middlePosition = (positionBottomLimit - positionTopLimit) / 2; //Metade (entre o top  e o bottom)

                if(_yPosition >= positionTopLimit) {
                  _yPosition += details.delta.dy;
                }
                //Limitando no top
                _yPosition = _yPosition < positionTopLimit ? positionTopLimit : _yPosition;
                //Limitando no bottom
                _yPosition = _yPosition > positionBottomLimit ? positionBottomLimit : _yPosition;

                //details.delta.dy > 0 - é maior que zero porque está movendo para baixo
                if(_yPosition != positionBottomLimit && details.delta.dy > 0){ //Se não for a última de baixo
                  _yPosition = _yPosition > (positionTopLimit + middlePosition - 50) ? positionBottomLimit : _yPosition; //Joga para baixo caso a condição é verdadeira
                }

                //details.delta.dy > 0 - é menor que zero porque está movendo para cima
                if(_yPosition != positionTopLimit && details.delta.dy < 0){ //Se não for a última de cima
                  _yPosition = _yPosition < (positionBottomLimit - middlePosition) ? positionTopLimit : _yPosition; //Joga para baixo caso a condição é verdadeira
                }

                if(_yPosition == positionBottomLimit){ //Quer dizer que está lá embaixo (está aberto)
                  _showMenu = true; //Fechar o menu
                } else if(_yPosition == positionTopLimit) { //Se a posição tiver lá em cima
                  _showMenu = false;
                }
              });
            },
          ),
          MyDots( //Posicionar
            showMenu: _showMenu, //Ocultando os dots caso _showMenu é true
            top: _screenHeight * .70,
            currentIndex: _currentIndex
          )
        ],
      )
    );
  }
}