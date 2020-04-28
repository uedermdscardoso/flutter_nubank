
import 'package:flutter/material.dart';
import 'package:nubank_flutter/widgets/bottom_menu/item_menu_bottom.dart';

class BottomMenu extends StatefulWidget {

  final bool showMenu;

  const BottomMenu({Key key, this.showMenu}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _BottomMenuState();
  }
}

class _BottomMenuState extends State<BottomMenu> {

  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0); //Começará no 150
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>( //Animando o bottom menu
        tween: _tween, //Propriedade a animação  - começa no 80 (no meio) e termina no 0
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutExpo, //Dando um efeito de elástico de ir e voltar
        builder: (context, value, child) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          bottom: !widget.showMenu ? 0 + MediaQuery.of(context).padding.bottom + 20 : 0, //se não aparecer o menu
          left: value, //Mudando a posição do left
          right: value * -1,  //Mudando a posição do right
          height: MediaQuery.of(context).size.height * 0.14,
          child: IgnorePointer(
            ignoring: widget.showMenu,
            child: AnimatedOpacity( //Para sumir
              duration: Duration(milliseconds: 200),
              opacity: !widget.showMenu ? 1 : 0,
              child: Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemMenuBottom(icon: Icons.person_add, text: 'indicar amigos'),
                    ItemMenuBottom(icon: Icons.phone_android, text: 'Recarga de celular'),
                    ItemMenuBottom(icon: Icons.chat, text: 'Cobrar'),
                    ItemMenuBottom(icon: Icons.monetization_on, text: 'Empréstimos'),
                    ItemMenuBottom(icon: Icons.move_to_inbox, text: 'Depositar'),
                    ItemMenuBottom(icon: Icons.mobile_screen_share, text: 'Transferir'),
                    ItemMenuBottom(icon: Icons.format_align_center, text: 'Ajustar limite'),
                    ItemMenuBottom(icon: Icons.chrome_reader_mode, text: 'Pagar'),
                    ItemMenuBottom(icon: Icons.lock_open, text: 'Bloquear cartão')

                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}