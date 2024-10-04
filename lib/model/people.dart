class People {
  String nome;
  String cpf;
  String token;
  People(this.nome, this.cpf, this.token);

  // named constructor
  People.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        cpf = json['cpf'],
        token = json['token'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'cpf': cpf,
      'token': token,
    };
  }
 
}