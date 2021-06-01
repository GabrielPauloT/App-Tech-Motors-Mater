import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, Timestamp;
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'home_page.dart';

// ignore: must_be_immutable
class TodoCreate extends StatefulWidget {
  @override
  _TodoCreateState createState() => _TodoCreateState();
  var form = GlobalKey<FormState>();

  var titulo = TextEditingController();
  var descricao = TextEditingController();
}

class _TodoCreateState extends State<TodoCreate> {
  @override
  Widget build(BuildContext context) {
    var titulo = TextEditingController();
    var descricao = TextEditingController();

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
          _customTextField("Titulo", "titulo", titulo),
          SizedBox(height: 60),
          _customTextField("Descricao", "descricao", descricao),
          SizedBox(height: 60),
          SizedBox(height: 60),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Icon(FontAwesome.cancel),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FloatingActionButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('todo').add({
                    'titulo': titulo.text,
                    'descricao': descricao.text,
                    'feito': false,
                    'data': Timestamp.now(),
                    'excluido': false,
                  });

                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
      String title,
      String trailing,
      TextEditingController
          controller /* ,
      {List<TextInputFormatter>? inputFormatters} */
      ) {
    // ignore: unused_local_variable
    return Card(
        child: TextField(

            /* inputFormatters: inputFormatters, */
/*             keyboardType: title == "Nascimento"
                ? TextInputType.datetime
                : TextInputType.text, */
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
