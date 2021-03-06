import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, QuerySnapshot;
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'cadastro_produto.dart';

class ProdutoPage extends StatelessWidget {
  static String tag = '/home';

  @override
  Widget build(BuildContext context) {
    var snapshots = FirebaseFirestore.instance
        .collection('produto')
        .where('excluido', isEqualTo: false)
        .orderBy('data')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF513B5EB),
        title: Text('Produtos'),
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
            return Center(child: Text('Nenhum produto ainda'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int i) {
              var doc = snapshot.data!.docs[i];

              int quantidadesoma = doc['quantidade'];
              String result = quantidadesoma.toString();
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xF513B5EB),
                    child: Text(result),
                  )
                  /* Text(doc['quantidade']) */,
                  title: Text(doc['nome']),
                  subtitle: Text(doc['valor']),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      CircleAvatar(
                        child: FloatingActionButton(
                          backgroundColor: Colors.red[300],
                          foregroundColor: Colors.white,
                          child: Icon(FontAwesome.minus),
                          onPressed: () => doc.reference.update({
                            'quantidade': quantidadesoma - 1,
                          }),
                        ),
                      ),
                      CircleAvatar(
                        child: FloatingActionButton(
                          backgroundColor: Colors.green[300],
                          foregroundColor: Colors.white,
                          child: Icon(FontAwesome.plus),
                          onPressed: () => doc.reference.update({
                            'quantidade': quantidadesoma + 1,
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CadastroProduto()));
        },
        tooltip: 'Adicionar novo',
        child: Icon(Icons.add),
        backgroundColor: Color(0xF513B5EB),
      ),
    );
  }
}
