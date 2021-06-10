import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, Timestamp;
// ignore: unused_import
import 'package:crud_firebase/src/app/funcionario_page/funcionario_page.dart';
import 'package:crud_firebase/src/app/ordemServico_page/os_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'cliente_page.dart';

// ignore: must_be_immutable
class CadastroCliente extends StatefulWidget {
  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  @override
  Widget build(BuildContext context) {
    var nome = TextEditingController();
    var celular = TextEditingController();
    var endereco = TextEditingController();
    var bairro = TextEditingController();
    var nascimento = TextEditingController();
    var cpf = TextEditingController();
    var rg = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xF513B5EB),
        title: Text("Cadastro de Cliente"),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 15, left: 15),
        children: <Widget>[
          SizedBox(height: 60),
          _customTextField("Nome", "nome", nome),
          SizedBox(height: 30),
          _customTextField("Endereço", "endereco", endereco),
          SizedBox(height: 30),
          _customTextField("Bairro", "bairro", bairro),
          SizedBox(height: 30),
          _customTextField("Celular", "celular", celular, inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TelefoneInputFormatter(),
          ]),
          SizedBox(height: 30),
          _customTextField("Nascimento", "nascimento", nascimento,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter(),
              ]),
          SizedBox(height: 30),
          _customTextField("Cpf", "cpf", cpf, inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CpfInputFormatter()
          ]),
          SizedBox(height: 30),
          _customTextField("Rg", "rg", rg),
          SizedBox(height: 30),
          SizedBox(height: 60),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OsPage()));
              },
              child: Icon(FontAwesome.cancel),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FloatingActionButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('cliente').add({
                    'nome': nome.text,
                    'endereco': endereco.text,
                    'bairro': bairro.text,
                    'celular': celular.text,
                    'nascimento': nascimento.text,
                    'cpf': cpf.text,
                    'rg': rg.text,
                    'data': Timestamp.now(),
                    'excluido': false,
                  });

                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ClientePage()));
                  }
                },
                child: Icon(FontAwesome.ok),
              ),
            ),
          ])
        ],
      ),
    );
  }

  Widget _customTextField(
      String title, String trailing, TextEditingController controller,
      {List<TextInputFormatter>? inputFormatters}) {
    // ignore: unused_local_variable
    return Card(
        child: TextField(
            inputFormatters: inputFormatters,
            keyboardType: title == "Nascimento"
                ? TextInputType.datetime
                : TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
              fillColor: Color(0xFFE5E5E5),
              filled: true,
              border: OutlineInputBorder(),
              hintText: title,
              labelText: title,
              contentPadding: EdgeInsets.only(left: 20),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            )));
  }
}
