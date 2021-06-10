
import 'package:crud_firebase/src/shared/constants.dart';

import 'app_repository.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hasura_connect/hasura_connect.dart' show HasuraConnect;

class AppRepositoryImpl implements AppRepository {
  HasuraConnect clientHasura = HasuraConnect(HASURA_URL, headers: {
    "x-hasura-admin-secret":
        "wix482q9FObyFATuh9cG5mnKz0x68kpy3AfFyWFCe0NErtmAKEr1nZoNs0MeAXsF"
  });

  @override
  Future<List<Map>> getCharacters() async {
    final response = await clientHasura.query('''
      query {
  characters(order_by: {name: asc}) {
    id
    name
    age
  }
  }
    ''');

    return (response['data']['characters'] as List)
        .map((e) => {
              "id": e['id'],
              "name": e['name'],
              "age": e['age'],
            })
        .toList();
  }

  @override
  Future<void> createCharacters(String name, int age) async {
    return await clientHasura.mutation('''
    mutation MyMutation {
  insert_characters(objects: {name: "$name", age: $age}) {
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future updateCharacters(int id, String name, int age) async {
    return await clientHasura.mutation('''
   mutation MyMutation {
  update_characters(where: {id: {_eq: $id}}, _set: {name: "$name", age: $age}) {
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future deleteCharacters(int id) async {
    return await clientHasura.mutation('''
   mutation MyMutation {
  delete_characters(where: {id: {_eq: $id}}) {
    affected_rows
  }
  }

  ''');
  }

//login
  String getLogin = """
query {
  Login {
    senha
    email
    id
  }
}
""";

/* Cadastro de Ordem de serviço */
  @override
  Future<List<Map>> getOs() async {
    final response = await clientHasura.query('''
      query  {
  ordem_servico {
    valor
    servico
    id
    completo
    cliente
  }
  }
    ''');

    return (response['data']['ordem_servico'] as List)
        .map((e) => {
              "id": e['id'],
              "cliente": e['cliente'],
              "completo": e['completo'],
              "servico": e['servico'],
              "valor": e['valor'],
            })
        .toList();
  }

  @override
  Future<void> createOs(String cliente, String servico, double valor) async {
    return await clientHasura.mutation('''
    mutation MyMutation{
  insert_ordem_servico(objects: {cliente: "$cliente", servico: "$servico", valor: $valor}) {
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future updateOs(int id, String cliente, String servico, double valor,
      bool completo) async {
    return await clientHasura.mutation('''
   mutation MyMutation{
  update_ordem_servico(where: {id: {_eq: $id}}, _set: {
    cliente: "$cliente",
    servico: "$servico",
    valor: $valor, 
    completo: $completo
    }) {
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future deleteOs(int id) async {
    return await clientHasura.mutation('''
    mutation MyMutation {
    delete_ordem_servico(where: {id: {_eq: $id}}) {
      affected_rows
    }
  }
      ''');
  }

  //cadastro cliente
  @override
  Future<List<Map>> getCliente() async {
    final response = await clientHasura.query('''
      query {
  cliente {
    bairro
    celular
    cpf
    data_nascimento
    endereco
    id
    nome
    rg
  }
}
    ''');

    return (response['data']['cliente'] as List)
        .map((e) => {
              "id": e['id'],
              "nome": e['nome'],
              "endereco": e['endereco'],
              "data_nascimento": e['data_nascimento'],
              "rg": e['rg'],
              "cpf": e['cpf'],
              "celular": e['celular'],
              "bairro": e['bairro'],
            })
        .toList();
  }

  @override
  Future<void> createCliente(String nome, String endereco, String bairro,
      String celular, String nascimento, String cpf, String rg) async {
    return await clientHasura.mutation('''
    mutation MyMutation{
  insert_cliente(objects: {
    nome: "$nome",
    endereco: "$endereco",
    bairro: "$bairro",
    celular: "$celular",
    data_nascimento: "$nascimento",
    cpf: "$cpf",
    rg: "$rg",
    }){
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future updateCliente(int id, String nome, String endereco, String bairro,
      String celular, String nascimento, String cpf, String rg) async {
    return await clientHasura.mutation('''
   mutation MyMutation{
  update_cliente(where: {id: {_eq: $id}}, _set: {
    nome: "$nome",
    endereco: "$endereco",
    bairro: "$bairro",
    celular: "$celular",
    data_nascimento: "$nascimento",
    cpf: "$cpf",
    rg: "$rg",
    }) {
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future deleteCliente(int id) async {
    return await clientHasura.mutation('''
    mutation MyMutation{
    delete_cliente(where: {id: {_eq: $id}}) {
      affected_rows
    }
  }

    ''');
  }

  //Funcionario
  @override
  Future<List<Map>> getFuncionario() async {
    final response = await clientHasura.query('''
      query {
  funcionario {
    bairro
    celular
    cpf
    data_nascimento
    endereco
    id
    nome
    rg
  }
}
    ''');

    return (response['data']['funcionario'] as List)
        .map((e) => {
              "id": e['id'],
              "nome": e['nome'],
              "endereco": e['endereco'],
              "data_nascimento": e['data_nascimento'],
              "rg": e['rg'],
              "cpf": e['cpf'],
              "celular": e['celular'],
              "bairro": e['bairro'],
            })
        .toList();
  }

  @override
  Future<void> createFuncionario(String nome, String endereco, String bairro,
      String celular, String nascimento, String cpf, String rg) async {
    return await clientHasura.mutation('''
    mutation MyMutation{
  insert_funcionario(objects: {
    nome: "$nome",
    endereco: "$endereco",
    bairro: "$bairro",
    celular: "$celular",
    data_nascimento: "$nascimento",
    cpf: "$cpf",
    rg: "$rg",
    }){
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future updateFuncionario(int id, String nome, String endereco, String bairro,
      String celular, String nascimento, String cpf, String rg) async {
    return await clientHasura.mutation('''
   mutation MyMutation{
   update_funcionario(where: {id: {_eq: $id}}, _set: {
    nome: "$nome",
    endereco: "$endereco",
    bairro: "$bairro",
    celular: "$celular",
    data_nascimento: "$nascimento",
    cpf: "$cpf",
    rg: "$rg",
    }) {
    returning {
      id
    }
  }
  }
  ''');
  }

  @override
  Future deleteFuncionario(int id) async {
    return await clientHasura.mutation('''
    mutation MyMutation{
    delete_funcionario(where: {id: {_eq: $id}}) {
      affected_rows
    }
  }

    ''');
  }

}
