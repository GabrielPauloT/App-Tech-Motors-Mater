import 'package:flutter/material.dart';

import 'package:fluttericon/font_awesome_icons.dart';

class Profile extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xF513B5EB),
      ),
      body: SingleChildScrollView(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png"),
                  radius: 80,
                ),
              ),
            ),
            SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 80.0),
                padding: EdgeInsets.only(right: 20, left: 20, bottom: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                      hintText: "Nome"),
                  // ignore: missing_return
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "O nome é obrigatório";
                    }
                    if (name.length < 4) {
                      return "O nome deve ter mais de 3 caracteres";
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20, bottom: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                      hintText: "E-mail"),
                  // ignore: missing_return
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "O e-mail é obrigatório";
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 70.0,
              child: Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
                      hintText: "senha"),
                  // ignore: missing_return
                  validator: (senha) {
                    if (senha!.isEmpty) {
                      return "A senha é obrigatória";
                    }
                    if (senha.length < 6) {
                      return "A senha deve ter mais de 3 caracteres";
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              child: Container(
                padding: EdgeInsets.all(80),
                child: FloatingActionButton(
                    child: Icon(FontAwesome.ok),
                    backgroundColor: Color(0xF513B5EB),
                    onPressed: () {
                      _formKey.currentState!.validate()
                          // ignore: deprecated_member_use
                          ? Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("This is valid")))
                          // ignore: deprecated_member_use
                          : Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("This is not valid")));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
