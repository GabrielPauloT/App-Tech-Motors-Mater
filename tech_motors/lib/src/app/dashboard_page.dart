import 'package:crud_firebase/src/app/produto_page/produto_page.dart';
import 'package:crud_firebase/src/app/user_page/profile_page.dart';
import 'package:flutter/material.dart';

import 'cliente_page/cliente_page.dart';
import 'funcionario_page/funcionario_page.dart';
import 'ordemServico_page/os_page.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text("Tech Motors",
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xF513B5EB),
        ),
        drawer: new Drawer(
          child: ListView(children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: new Text(
                  "Tech Motors",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                accountEmail: new Text("TechMotors@tech.com.br"),
                currentAccountPicture: Image.asset('assets/logo1.png'),
                decoration: new BoxDecoration(color: Color(0xF513B5EB))),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            )
          ]),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset(
                  'assets/logo.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    /* Container(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/assets.dashboard/financeiro_dashboard.png',
                          width: 150,
                          height: 150,
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FuncionarioPage()));
                        },
                      ),
                      color: Colors.white,
                    ), */
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/assets.dashboard/clientes_dashboard.png',
                          width: 150,
                          height: 150,
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClientePage()));
                        },
                      ),
                      color: Colors.white,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/assets.dashboard/O.S_dashboard.png',
                          width: 150,
                          height: 150,
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OsPage()));
                        },
                      ),
                      color: Colors.white,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/assets.dashboard/peças_dashboard.png',
                          width: 150,
                          height: 150,
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProdutoPage()));
                        },
                      ),
                      color: Colors.white,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/assets.dashboard/funcionarios_dashboard.png',
                          width: 150,
                          height: 150,
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FuncionarioPage()));
                        },
                      ),
                      color: Colors.white,
                    ),
                  ]),
            )
          ],
        ));
  }
}
