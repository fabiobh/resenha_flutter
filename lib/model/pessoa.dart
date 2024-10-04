class MinhaPessoa {
  Usuario? usuario;

  MinhaPessoa({this.usuario});

  MinhaPessoa.fromJson(Map<String, dynamic> json) {
    usuario =
        json['usuario'] != null ? new Usuario.fromJson(json['usuario']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuario != null) {
      data['usuario'] = this.usuario!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['token'] = this.token;
    return data;
  }
}
