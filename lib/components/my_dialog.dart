import 'package:flutter/material.dart';

showAlertDialog1(BuildContext context, String mensagem) 
{ 
    // configura o button
  Widget okButton = ElevatedButton(
    child: const Text("OK"),
    onPressed: () { Navigator.pop(context); },
  );

  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: const Text("Alerta"),
    content: Text(mensagem),
    actions: [
      okButton,
    ],
  );

  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}