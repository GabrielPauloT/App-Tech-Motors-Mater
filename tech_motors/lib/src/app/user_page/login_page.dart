import 'package:crud_firebase/src/app/dashboard_page.dart';
import 'package:crud_firebase/src/app/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';

import 'package:fluttericon/font_awesome_icons.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final repository = AppRepositoryImpl();
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 78.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      //initialValue: 'techmotors@tech.com',
      decoration: InputDecoration(
        hintText: 'Usuário',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      //initialValue: 'some password',
      obscureText: true,
      controller: senhaController,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        child: FloatingActionButton(
          onPressed: () async {
            var login =
                await repository.clientHasura.query(repository.getLogin);
            List<String> novoLogin =
                login.toString().split(new RegExp('(: |, |})'));
//verificar se o campo preenchido é igual ao do banco ou seja email e senha do formulário é igual a do banco.
            bool existe = false;
            //criar sistema de quantificação de testes
            double qntTestes = ((novoLogin.length - 4) / 7);
            //calculo var x pra descobrir quantos loops vai fazer pra todos os usários
            // criar sistema de for para loop
            var contador = 3;
            for (var i = 1; i <= qntTestes; i++) {
              var senha = novoLogin[contador];
              contador += 2;
              var email = novoLogin[contador];
              if (email == senhaController.text) {
                if (senha == emailController.text) {
                  existe = true;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Dashboard()));
                }
              }
              contador += 5;
            }
            if (!existe) {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text("Usuário ou senha incorreta!"),
                        actions: <Widget>[
                          TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ]);
                  });
            }
          },
          child: Icon(FontAwesome.ok),
          backgroundColor: Color(0xF513B5EB),
        ),
      ),
    );

    /* final forgotLabel = TextButton(
      child: Text(
        '',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    ); */

    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            /*  forgotLabel */
          ],
        ),
      ),
    );
  }
}
