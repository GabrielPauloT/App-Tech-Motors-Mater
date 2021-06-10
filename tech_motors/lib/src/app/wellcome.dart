/* import 'package:crud_firebase/src/app/user_page/login_page.dart'; */
import 'package:crud_firebase/src/app/user_page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wellcome extends StatefulWidget {
  @override
  _WellcomeState createState() => _WellcomeState();
}
 
class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text('Bem-vindo', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xF513B5EB),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 80),
              child: Image.asset(
                'assets/logo1.png',
                width: 400,
                height: 400,
              ),
            ),
            Center(
              child: Text(
                'Seja Bem-vindo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xF513B5EB),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(29),
              child: CupertinoButton(
                color: Color(0xF513B5EB),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
