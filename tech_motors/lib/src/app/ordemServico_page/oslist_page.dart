import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: must_be_immutable
class OsList extends StatefulWidget {
  String cliente;
  String servico;
  String funcionario;
  String valor;

  OsList(this.cliente, this.servico, this.funcionario, this.valor);

  @override
  _OsListState createState() => _OsListState();
}

class _OsListState extends State<OsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF513B5EB),
        title: Text('Cliente'),
      ),
      backgroundColor: Color(0xFFE5E5E5),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(FontAwesome.user),
            ),
            title: Text(widget.cliente),
          ),
          ListTile(
            leading: Icon(FontAwesome.black_tie),
            title: Text(widget.funcionario),
          ),
          ListTile(
            leading: Icon(Entypo.tools),
            title: Text(widget.servico),
          ),
          ListTile(
            leading: Icon(FontAwesome.money),
            title: Text(widget.valor),
          ),
        ],
      ),
    );
  }
}
