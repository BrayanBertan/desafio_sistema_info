import 'package:desafio_flutter/app/banco/banco.dart';
import 'package:desafio_flutter/app/classes/usuario.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioModel {
  final bancoService = Get.put(BancoService());

  Future<Map<String, dynamic>> salvarUsuario(Usuario usuario) async {
    Map<String, dynamic> retorno = {};
    Database dbUsuario = await bancoService.db;
    usuario.codigo = await dbUsuario.insert("usuarios", usuario.toMap());
    if (usuario.codigo != null) {
      retorno['status'] = true;
      retorno['mensagem'] =
          'Pessoa cadastrada com sucesso,  ${usuario.cpf!.replaceAll('.', '').substring(0, 4)}';
      return retorno;
    }
    retorno['status'] = false;
    retorno['mensagem'] = 'Erro ao cadastrar usuario';
    return retorno;
  }

  bool verificaLogin(String usuario, String senha) {
    print('usuario $usuario senha $senha');
    return (usuario.trim().toUpperCase() == 'SISTEMA' &&
        senha.trim().toUpperCase() == 'CANDIDATO123');
  }

  Future<int> deletarUsuario(int codigo) async {
    Database dbUsuario = await bancoService.db;
    return await dbUsuario
        .delete("usuarios", where: "codigo = ?", whereArgs: [codigo]);
  }

  Future<Map<String, dynamic>> atualizarUsuario(Usuario usuario) async {
    Database dbUsuario = await bancoService.db;
    Map<String, dynamic> retorno = {};
    int linhasAfetadas = await dbUsuario.update("usuarios", usuario.toMap(),
        where: "codigo = ?", whereArgs: [usuario.codigo]);

    if (linhasAfetadas > 0) {
      retorno['status'] = true;
      retorno['mensagem'] =
          'Pessoa atualizada com sucesso,  ${usuario.cpf!.replaceAll('.', '').substring(0, 4)}';
      return retorno;
    }
    retorno['status'] = false;
    retorno['mensagem'] = 'Erro ao atualizar usuario';
    return retorno;
  }

  Future<List<Usuario>> getAllUsuario() async {
    Database dbUsuario = await bancoService.db;
    List<Map> maps = await dbUsuario.rawQuery("SELECT * FROM usuarios");
    print(maps);
    List<Usuario> listUsuario = [];
    for (Map m in maps) {
      listUsuario.add(Usuario.fromMap(m));
    }
    return listUsuario;
  }

  Future fechar() async {
    Database dbUsuario = await bancoService.db;
    dbUsuario.close();
  }
}
