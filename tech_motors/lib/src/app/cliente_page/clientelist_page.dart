import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: must_be_immutable
class ClienteList extends StatefulWidget {
  String nome;
  String celular;
  String endereco;
  String bairro;
  String nascimento;
  String cpf;
  String rg;

  ClienteList(this.nome, this.celular, this.endereco, this.bairro,
      this.nascimento, this.cpf, this.rg);

  @override
  _ClienteListState createState() => _ClienteListState();
}

class _ClienteListState extends State<ClienteList> {
  @override
  Widget build(BuildContext context) {
    /* final nomeController = TextEditingController(text: widget.nome); */

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
              padding: const EdgeInsets.all(12),
              child: Icon(FontAwesome.user),
            ),
            title: Text(widget.nome),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(Icons.phone),
            ),
            title: Text(widget.celular),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FontAwesome.location),
            ),
            title: Text(widget.endereco),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FontAwesome.location),
            ),
            title: Text(widget.bairro),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FontAwesome.calendar),
            ),
            title: Text(widget.nascimento),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FontAwesome.male),
            ),
            title: Text(widget.cpf),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FontAwesome.doc),
            ),
            title: Text(
              widget.rg,
            ),
          )
        ],
      ),
    );
  }
}
