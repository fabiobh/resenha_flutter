
class MinhaPessoa {
  // https://javiercbk.github.io/json_to_dart/
  // modelo criado a partir do copia e cola no site acima

  Usuario? usuario;

  MinhaPessoa({usuario});

  MinhaPessoa.fromJson(Map<String, dynamic> json) {
    usuario =
        json['usuario'] != null ? Usuario.fromJson(json['usuario']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usuario != null) {
      data['usuario'] = usuario!.toJson();
    }
    return data;
  }
}

class Usuario {
  String? nome;
  String? cpf;
  String? token;

  Usuario({this.nome, this.cpf, this.token});

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['token'] = token;
    return data;
  }
}
