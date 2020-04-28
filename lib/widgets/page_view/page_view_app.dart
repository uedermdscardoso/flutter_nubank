
import 'package:flutter/cupertino.dart';
import 'package:nubank_flutter/widgets/cards/card_app.dart';
import 'package:nubank_flutter/widgets/cards/first_card.dart';
import 'package:nubank_flutter/widgets/cards/second_card.dart';
import 'package:nubank_flutter/widgets/cards/third_card.dart';

class PageViewApp extends StatefulWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate; //Fazendo o nosso próprio callback
  final bool showMenu;

  const PageViewApp({Key key, this.top, this.onChanged, this.onPanUpdate, this.showMenu}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _PageViewAppState();
  }
}

class _PageViewAppState extends State<PageViewApp> {

  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0); //Começará no 150
  }

  @override
  Widget build(BuildContext context) {

    return TweenAnimationBuilder<double>( //Animando o card branco
      tween: _tween, //Propriedade a animação  - começa no 80 (no meio) e termina no 0
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOutExpo, //Dando um efeito de elástico de ir e voltar
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            top: widget.top,
            height: MediaQuery.of(context).size.height * 0.45,
            left: value, //Mudando a posição do left
            right: value * -1, //Começa no canto - Passa ao lado da direita
            //width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdate, //Move o item quando é clicado
              child: PageView(
                onPageChanged: widget.onChanged,
                    physics: widget.showMenu ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(), //Não mover quando a condição for verdadeira
                    children: <Widget>[
                      CardApp(child: FirstCard()),
                      CardApp(child: SecondCard()),
                      CardApp(child: ThirdCard())
                    ]
              ),
            ),
        );
      }
    );
  }
}