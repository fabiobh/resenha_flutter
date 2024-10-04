// To parse this JSON data, do
//
//     final pessoa = pessoaFromJson(jsonString);

import 'dart:convert';

Pessoa pessoaFromJson(String str) => Pessoa.fromJson(json.decode(str));

String pessoaToJson(Pessoa data) => json.encode(data.toJson());

class Pessoa {
    Usuario usuario;

    Pessoa({
        required this.usuario,
    });

    factory Pessoa.fromJson(Map<String, dynamic> json) => Pessoa(
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
    };
}

class Usuario {
    String nome;
    String cpf;
    String token;

    Usuario({
        required this.nome,
        required this.cpf,
        required this.token,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nome: json["nome"],
        cpf: json["cpf"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "cpf": cpf,
        "token": token,
    };
}
