import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, Timestamp;
import 'package:crud_firebase/src/app/produto_page/produto_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart'
    show MoneyMaskedTextController;
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: must_be_immutable
class CadastroProduto extends StatefulWidget {
  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  @override
  Widget build(BuildContext context) {
    var nome = TextEditingController();
    var quantidade = TextEditingController();
    var valor = new MoneyMaskedTextController(leftSymbol: 'R\$ ');

    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xF513B5EB),
        title: Text("Cadastro de Produto"),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 15, left: 15),
        children: <Widget>[
          SizedBox(height: 60),
          _customTextField("Nome", "nome", nome),
          SizedBox(height: 60),
          _customTextField("Quantidade", "quantidade", quantidade),
          SizedBox(height: 60),
          _customTextField(
            "Valor",
            "valor",
            valor,
          ),
          SizedBox(height: 60),
          SizedBox(height: 60),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProdutoPage()));
              },
              child: Icon(FontAwesome.cancel),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FloatingActionButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('produto').add({
                    'nome': nome.text,
                    'quantidade': quantidade.text,
                    'valor': valor.text,
                    'data': Timestamp.now(),
                    'excluido': false,
                  });

                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProdutoPage()));
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
    return Card(
        child: TextField(
            inputFormatters: inputFormatters,
            keyboardType:
                title == "Valor" ? TextInputType.number : TextInputType.text,
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
