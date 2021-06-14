// ignore: import_of_legacy_library_into_null_safe
import 'package:animations/animations.dart'
    show ContainerTransitionType, OpenContainer;
import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, QuerySnapshot;
import 'package:crud_firebase/src/app/funcionario_page/cadastro_funcionario.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'funcionariolist_page.dart';

class FuncionarioPage extends StatelessWidget {
  static String tag = '/home';

  @override
  Widget build(BuildContext context) {
    var snapshots = FirebaseFirestore.instance
        .collection('funcionario')
        .where('excluido', isEqualTo: false)
        .orderBy('data')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF513B5EB),
        title: Text('Funcionario'),
      ),
      backgroundColor: Color(0xFFE5E5E5),
      body: StreamBuilder(
        stream: snapshots,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.length == 0) {
            return Center(child: Text('Nenhum Funcionario ainda'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int i) {
              var doc = snapshot.data!.docs[i];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(5),
                child: OpenContainer(
                    transitionDuration: Duration(milliseconds: 600),
                    transitionType: ContainerTransitionType.fadeThrough,
                    closedElevation: 2,
                    closedBuilder: (context, action) {
                      return ListTile(
                        isThreeLine: true,
                        leading: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(FontAwesome.black_tie),
                        ),
                        title: Text(doc['nome']),
                        subtitle: Text(doc['celular']),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.red[300],
                          foregroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => doc.reference.update({
                              'excluido': true,
                            }),
                          ),
                        ),
                      );
                    },
                    openBuilder: (context, action) {
                      return FuncionarioList(
                        doc['nome'],
                        doc['celular'],
                        doc['endereco'],
                        doc['bairro'],
                        doc['nascimento'],
                        doc['cpf'],
                        doc['rg'],
                      );
                    }),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CadastroFuncionario()));
        },
        tooltip: 'Adicionar novo',
        child: Icon(Icons.add),
        backgroundColor: Color(0xF513B5EB),
      ),
    );
  }
}
