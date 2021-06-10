abstract class AppRepository {
  Future getCharacters();
  Future createCharacters(String name, int age);
  Future updateCharacters(int id, String name, int age);
  Future deleteCharacters(int id);

  //Ordem de Serviço
  Future getOs();
  Future createOs(String cliente, String servico, double valor);
  Future updateOs(
      int id, String cliente, String servico, double valor, bool completo);
  Future deleteOs(int id);

  //Cliente
  Future getCliente();
  Future createCliente(String nome, String endereco, String bairro,
      String celular, String nascimento, String rg, String cpf);
  Future updateCliente(int id, String nome, String endereco, String bairro,
      String celular, String nascimento, String rg, String cpf);
  Future deleteCliente(int id);

  //Funcionarios
  Future getFuncionario();
  Future createFuncionario(String nome, String nascimento, String cpf,
      String rg, String celular, String endereco, String bairro);
  Future updateFuncionario(int id, String nome, String nascimento, String cpf,
      String rg, String celular, String endereco, String bairro);
  Future deleteFuncionario(int id);
}
