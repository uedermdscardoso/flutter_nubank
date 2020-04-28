
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDots extends StatelessWidget {

  final int currentIndex;
  final double top;
  final bool showMenu;

  const MyDots({Key key, this.currentIndex, this.top, this.showMenu}) : super(key: key);

  Color getColor(int index){
    return index == currentIndex ? Colors.white : Colors.white38; //Se é a mesma página
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 0 : 1, //Remover os dots quando showMenu é true
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                  color: getColor(0),
                  shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 8), //Espaçamento
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                  color: getColor(1),
                  shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 8), //Espaçamento
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                  color: getColor(2),
                  shape: BoxShape.circle
              ),
            )
          ],
        ),
      ),
    );
  }
}