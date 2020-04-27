
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalPageBar extends StatelessWidget {

  final bool showMenu;
  final VoidCallback onTap;

  const PrincipalPageBar({Key key, this.showMenu, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        SizedBox( //Dando espaçamento no topo
          height: MediaQuery.of(context).padding.top
        ),
        GestureDetector( //Para conseguir pegar o click
          onTap: onTap,
          child: Container(
            color: Colors.purple[800],
            height: MediaQuery.of(context).size.height * .20, //Pegar o tamanho da tela
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                        "https://logodownload.org/wp-content/uploads/2019/08/nubank-logo-3.png",
                        height: 30,
                        color: Colors.white
                    ),
                    SizedBox(
                        width: 10
                    ),
                    Text(
                        'Ueder',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        )
                    )
                  ],
                ),
                Icon(!showMenu ? Icons.expand_more : Icons.expand_less)
              ],
            ),
          ),
        )
      ],
    );
  }
}