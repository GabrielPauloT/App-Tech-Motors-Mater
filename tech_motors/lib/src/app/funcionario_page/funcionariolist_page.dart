import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

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
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(FontAwesome.user),
            ),
            title: Text(widget.nome),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(widget.celular),
          ),
          ListTile(
            leading: Icon(FontAwesome.location),
            title: Text(widget.endereco),
          ),
          ListTile(
            leading: Icon(FontAwesome.location),
            title: Text(widget.bairro),
          ),
          ListTile(
            leading: Icon(FontAwesome.calendar),
            title: Text(widget.nascimento),
          ),
          ListTile(
            leading: Icon(FontAwesome.male),
            title: Text(widget.cpf),
          ),
          ListTile(
            leading: Icon(FontAwesome.doc),
            title: Text(
              widget.rg,
            ),
          )
        ],
      ),
    );
  }
}
