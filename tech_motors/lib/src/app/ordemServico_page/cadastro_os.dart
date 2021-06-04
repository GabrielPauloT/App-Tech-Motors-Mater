import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, Timestamp;
import 'package:crud_firebase/src/app/ordemServico_page/os_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: must_be_immutable
class CadastroOs extends StatefulWidget {
  @override
  _CadastroOsState createState() => _CadastroOsState();
}

class _CadastroOsState extends State<CadastroOs> {
  @override
  Widget build(BuildContext context) {
    var cliente = TextEditingController();
    var servico = TextEditingController();
    var valor = TextEditingController();
    var funcionario = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xF513B5EB),
        title: Text("Cadastro de Ordem de Serviço"),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 15, left: 15),
        children: <Widget>[
          SizedBox(height: 60),
          _customTextField("Cliente", "cliente", cliente),
          SizedBox(height: 60),
          _customTextField("Servico", "servico", servico),
          SizedBox(height: 60),
          _customTextField("Funcionario", "funcionario", funcionario),
          SizedBox(height: 60),
          _customTextField("Valor", "valor", valor),
          SizedBox(height: 60),
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
                  await FirebaseFirestore.instance
                      .collection('ordem_servico')
                      .add({
                    'cliente': cliente.text,
                    'servico': servico.text,
                    'valor': valor.text,
                    'funcionario': funcionario.text,
                    'feito': false,
                    'data': Timestamp.now(),
                    'excluido': false,
                  });

                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OsPage()));
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
      String title, String trailing, TextEditingController controller) {
    return Card(
        child: TextField(
            keyboardType: TextInputType.text,
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
