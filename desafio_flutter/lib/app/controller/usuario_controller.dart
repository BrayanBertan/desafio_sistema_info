import 'package:desafio_flutter/app/classes/usuario.dart';
import 'package:desafio_flutter/app/model/usuario_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  UsuarioModel usuarioModel;
  UsuarioController({required this.usuarioModel});

  @override
  void onInit() {
    super.onInit();
    setControllers();
    getAllUsuarios();
  }

  final usuarioLogin = ''.obs;
  final senhaLogin = ''.obs;
  final erroLogin = Rxn<String?>();

  final codigo = Rxn<int?>();
  final nome = Rxn<String?>();
  final cpf = Rxn<String?>();
  final endereco = ''.obs;
  final telefone = ''.obs;
  final usuarios = <Usuario>[].obs;

  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final enderecoController = TextEditingController();
  final telefoneController = TextEditingController();

  final mensagemRetornoCadastro = ''.obs;

  bool verificaLogin() {
    var retorno =
        usuarioModel.verificaLogin(usuarioLogin.value, senhaLogin.value);
    erroLogin.value = null;
    if (!retorno) erroLogin.value = 'Dados incorretos!';
    return retorno;
  }

  setUsuarioLogin(String usuario) => usuarioLogin.value = usuario;

  setSenhaLogin(String senha) => senhaLogin.value = senha;

  setCodigo(int val) => codigo.value = val;

  setNome(String val) => nome.value = val;

  setCpf(String val) => cpf.value = val;

  setendereco(String val) => endereco.value = val;

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
    var retorno;
    final usuario = Usuario(
        nome: nome.value,
        cpf: cpf.value,
        endereco: endereco.value,
        telefone: telefone.value);

    if (codigo.value == null)
      retorno = await usuarioModel.salvarUsuario(usuario);
    else {
      usuario.codigo = codigo.value;
      retorno = await usuarioModel.atualizarUsuario(usuario);
    }

    mensagemRetornoCadastro.value = retorno['mensagem'];
    if (retorno['status']) {
      limparFormulario();
      getAllUsuarios();
    }
    ;
    Future.delayed(const Duration(seconds: 5))
        .then((value) => mensagemRetornoCadastro.value = '');
  }

  Future<void> getAllUsuarios() async {
    usuarioModel.getAllUsuario().then((value) => usuarios.assignAll(value));
  }

  Future<void> deletarUsuario(int id) async {
    await usuarioModel.deletarUsuario(id);
    getAllUsuarios();
  }

  void limparFormulario() {
    codigo.value = null;
    nome.value = null;
    cpf.value = null;
    endereco.value = '';
    telefone.value = '';

    setControllers();
  }

  void setControllers() {
    nomeController.text = '';
    cpfController.text = '';
    enderecoController.text = '';
    telefoneController.text = '';
  }

  void setEditar(Usuario usuario) {
    print('editar ${usuario}');
    codigo.value = usuario.codigo;
    nome.value = usuario.nome;
    cpf.value = usuario.cpf;
    endereco.value = usuario.endereco!;
    telefone.value = usuario.telefone!;

    nomeController.text = usuario.nome!;
    cpfController.text = usuario.cpf!;
    enderecoController.text = usuario.endereco!;
    telefoneController.text = usuario.telefone!;
  }
}
