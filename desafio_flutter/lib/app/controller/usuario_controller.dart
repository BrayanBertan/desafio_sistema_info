import 'package:desafio_flutter/app/model/usuario_model.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  UsuarioModel usuarioModel;
  UsuarioController({required this.usuarioModel});

  final usuarioLogin = ''.obs;
  final senhaLogin = ''.obs;
  final erroLogin = Rxn<String?>();

  final codigo = Rxn<int?>();
  final nome = Rxn<String?>();
  final cpf = Rxn<String?>();
  final endereco = ''.obs;
  final telefone = ''.obs;

  bool verificaLogin() {
    var retorno =
        usuarioModel.verificaLogin(usuarioLogin.value, senhaLogin.value);
    erroLogin.value = null;
    print('retorno $retorno');
    if (!retorno) erroLogin.value = 'Dados incorretos!';
    return retorno;
  }

  setUsuarioLogin(String usuario) => usuarioLogin.value = usuario;

  setSenhaLogin(String senha) => senhaLogin.value = senha;

  setCodigo(int val) => codigo.value = val;

  setNome(String val) => nome.value = val;

  setCpf(String val) => cpf.value = val;

  setEndereco(String val) => endereco.value = val;

  setTelefone(String val) => telefone.value = val;

  bool nomeValido() => nome.value != null && nome.value!.trim().isNotEmpty;

  String? nomeErroMensagem() {
    if (nome.value == null || nomeValido()) return null;
    return 'Campo obrigatorio';
  }

  bool cpfValido() => cpf.value != null && cpf.value!.trim().isNotEmpty;

  String? cpfErroMensagem() {
    if (cpf.value == null || cpfValido()) return null;
    return 'Campo obrigatorio';
  }

  bool formularioValido() => nomeValido() && cpfValido();

  Future<void> cadastrar() async {
    print(telefone);
  }
}
