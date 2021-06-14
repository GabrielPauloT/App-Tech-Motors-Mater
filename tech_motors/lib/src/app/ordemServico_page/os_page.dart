// ignore: import_of_legacy_library_into_null_safe
import 'package:animations/animations.dart' show ContainerTransitionType, OpenContainer;
import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, QuerySnapshot;
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'cadastro_os.dart';
import 'oslist_page.dart';

class OsPage extends StatelessWidget {
  static String tag = '/home';

  @override
  Widget build(BuildContext context) {
    var snapshots = FirebaseFirestore.instance
        .collection('ordem_servico')
        .where('excluido', isEqualTo: false)
        .orderBy('data')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF513B5EB),
        title: Text('Ordem de Serviço'),
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
            return Center(child: Text('Nenhuma tarefa ainda'));
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
                      leading: IconButton(
                        icon: Icon(
                          doc['feito']
                              ? FontAwesome.ok_circled
                              : FontAwesome.circle_thin,
                          size: 32,
                        ),
                        onPressed: () => doc.reference.update /* updateData */ ({
                          'feito': !doc['feito'],
                        }),
                      ),
                      title: Text(doc['cliente']),
                      subtitle: Text(doc['servico']),
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
                    return OsList(
                      doc['cliente'],
                      doc['servico'],
                      doc['funcionario'],
                      doc['valor'],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CadastroOs()));
        },
        tooltip: 'Adicionar novo',
        child: Icon(Icons.add),
        backgroundColor: Color(0xF513B5EB),
      ),
    );
  }
}
