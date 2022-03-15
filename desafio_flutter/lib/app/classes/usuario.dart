class Usuario {
  int? codigo;
  String? nome;
  String? cpf;
  String? endereco;
  String? telefone;

  Usuario({this.nome, this.cpf, this.endereco, this.telefone});

  Usuario.fromMap(Map map) {
    codigo = map['codigo'];
    nome = map['nome'];
    cpf = map['cpf'];
    endereco = map['endereco'];
    telefone = map['telefone'];
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'nome': nome,
      'cpf': cpf,
      'endereco': endereco,
      'telefone': telefone,
    };
    if (codigo != null) {
      map['codigo'] = codigo;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: $codigo Nome: $nome senha: $nome";
  }
}
