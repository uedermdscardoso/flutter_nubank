
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SecondCardState();
  }
}

// AutomaticKeepAliveClientMixin é usado para guardar estado que foi feito
class _SecondCardState extends State<SecondCard> with AutomaticKeepAliveClientMixin {

  bool _showSaldo = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3, //Define a largura
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, //Alinhando os textos no começo
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding( //Onde fica o icone do cartão de crédito
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, //Fica no canto
                          children: <Widget>[
                            Row( //Um ao lado do outro
                              children: <Widget>[
                                Icon(Icons.attach_money, color: Colors.grey),
                                SizedBox(width: 5), //Espaçamento
                                Text('Conta', style: TextStyle(color: Colors.grey, fontSize: 13))
                              ],
                            ),
                            GestureDetector( //Detectar click
                              onTap: (){
                                setState(() {
                                  _showSaldo = !_showSaldo;
                                });
                              },
                              child: SvgPicture.asset(
                                  !_showSaldo ? 'assets/icons/eye-off-outline.svg' : 'assets/icons/eye-outline.svg',
                                  color: Colors.grey,
                                  semanticsLabel: 'disable_eye'
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20, top: 20, bottom: 20),
                        child: SizedBox(
                          width: double.infinity, //Resolver o bud e centralizar o texto e o valor
                          child: Column( //Um embaixo do outro
                            crossAxisAlignment: CrossAxisAlignment.start, //Alinhar no começo
                            children: <Widget>[
                              Text(
                                  'Saldo disponível',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13
                                  )
                              ),
                              _showSaldo ? Text.rich( //Value
                                  TextSpan(
                                      text: 'R\$ 3.369,50'
                                  ),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28
                                  )
                              ) : Container(
                                height: 32,
                                width: 160,
                                color: Colors.grey[300],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05)
                    ]
                )
            ),
          ),
          Expanded( //Quadro cinza
            flex: 1, //Define a largura
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.credit_card, color: Colors.grey),
                    SizedBox(width: 10), //Espaçamento
                    Flexible( //Quebrar o texto
                      child: Text(
                        'Compra mais recente em supermercado no valor de R\$ 253,00 quarta',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey[400], size: 18)
                  ],
                ),
              ),
              color: Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; //Irá manter o estado neste container
}