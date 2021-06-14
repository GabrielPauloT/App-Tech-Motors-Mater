import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

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
        title: Text('Ordem de Serviço'),
      ),
      backgroundColor: Color(0xFFE5E5E5),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Container(
            width: 80,
            height: 80,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    MdiIcons.contactsOutline,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.cliente,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    FontAwesome.black_tie,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.funcionario,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Entypo.tools,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.servico,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    FontAwesome.money,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.valor,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
