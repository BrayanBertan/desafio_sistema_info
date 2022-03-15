import 'package:desafio_flutter/app/model/usuario_model.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  UsuarioModel usuarioModel;
  UsuarioController({required this.usuarioModel});

  final usuarioLogin = ''.obs;
  final senhaLogin = ''.obs;
  final erroLogin = Rxn<String?>();

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
}
