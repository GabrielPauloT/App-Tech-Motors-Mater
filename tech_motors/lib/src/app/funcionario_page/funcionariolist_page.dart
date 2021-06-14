import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

// ignore: must_be_immutable
class FuncionarioList extends StatefulWidget {
  String nome;
  String celular;
  String endereco;
  String bairro;
  String nascimento;
  String cpf;
  String rg;

  FuncionarioList(this.nome, this.celular, this.endereco, this.bairro,
      this.nascimento, this.cpf, this.rg);

  @override
  _FuncionarioListState createState() => _FuncionarioListState();
}

class _FuncionarioListState extends State<FuncionarioList> {
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
          Container(
            width: 80,
            height: 80,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    MdiIcons.contactsOutline,
                    size: 40,
                  ),
                ),
                title: Text(
                  widget.nome,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 65,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.phone,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.celular,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 65,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    MdiIcons.store,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.endereco,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 65,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    FontAwesome.location,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.bairro,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 65,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    FontAwesome.calendar,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.nascimento,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 65,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    MdiIcons.badgeAccountOutline,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.cpf,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 65,
            child: Card(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    MdiIcons.badgeAccountHorizontalOutline,
                    size: 35,
                  ),
                ),
                title: Text(
                  widget.rg,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
