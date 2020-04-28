
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3, //Define a largura
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded( //Ocupe a parte inteira
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, //Alinhando os textos no começo
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding( //Onde fica o icone do cartão de crédito
                            padding: const EdgeInsets.all(20),
                            child: Row( //Um ao lado do outro
                              children: <Widget>[
                                Icon(Icons.credit_card, color: Colors.grey),
                                SizedBox(width: 5), //Espaçamento
                                Text('Cartão de Crédito', style: TextStyle(color: Colors.grey, fontSize: 13))
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
                                    'FATURA ATUAL',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Text.rich( //Value
                                    TextSpan(
                                      text: 'R\$ ',
                                      children: [
                                        TextSpan(text: '765', style: TextStyle(fontWeight: FontWeight.bold)),
                                        TextSpan(text: ',43')
                                      ]
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 28
                                    )
                                  ),
                                  Text.rich(
                                      TextSpan(
                                          text: 'Limite disponível',
                                          children: [
                                            TextSpan(text: ' R\$ 3.564,85', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                          ]
                                      ),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05)
                        ]
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5), //Arredontar as bordas
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(flex: 3, child: Container(color: Colors.orange)),
                            Expanded(flex: 1, child: Container(color: Colors.blue)),
                            Expanded(flex: 2, child: Container(color: Colors.green))
                          ],
                        ),
                        width: 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ),
                  )
                ],
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
                    Icon(Icons.shopping_cart, color: Colors.grey),
                    SizedBox(width: 10), //Espaçamento
                    Flexible( //Quebrar o texto
                      child: Text(
                        'Compra mais recente em supermercado no valor de R\$ 65,00 segunda',
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
}