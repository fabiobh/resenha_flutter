import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/my_alert_dialog.dart';
//import 'dart:convert';
//import 'package:flutter_resenha/components/my_image_button.dart';
//import 'package:flutter_resenha/constants/my_constants.dart';
//import 'package:flutter_resenha/views/requisicao_exames.dart';
//import 'package:flutter_resenha/components/auth.dart';
import 'package:flutter_resenha/components/my_network_manager.dart';
import 'package:flutter_resenha/model/minha_pessoa.dart';
import 'package:flutter_resenha/views/menu_principal.dart';

class LoginViewFull extends StatefulWidget {
  const LoginViewFull({super.key});

  @override
  State<LoginViewFull> createState() => _LoginViewFullState();
}

class _LoginViewFullState extends State<LoginViewFull> {
  String _cpfValue = ''; // Variável para armazenar o valor do TextField
  String _passwordValue = '';

  // Função que atualiza o valor do TextField
  void _updateCpf(String newText) {
    debugPrint('Valor atualizado cpf: $newText'); // Verificação do valor atualizado
    setState(() {
      _cpfValue = newText; // Atualiza o estado
    });
  }

  void _updateSenha(String newText) {
    debugPrint('Valor atualizado senha: $newText'); // Verificação do valor atualizado
    setState(() {
      _passwordValue = newText; // Atualiza o estado
    });
  }

  // Função que será chamada quando o botão for pressionado
  void _buttonPressed() {
    debugPrint('Botão pressionado com texto: $_cpfValue'); // Exibe o valor atual
    debugPrint('Botão pressionado com texto: $_passwordValue');
    makeLoginRequest(context, _cpfValue, _passwordValue);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resenhas'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("_assets_/resenha_2.png", 
              height: 200, 
              width: 150,
              fit: BoxFit.contain,
            ),
            
            //MyCustomTextField(onChanged: _updateText), 
            CpfTextField(onChanged: _updateCpf),
            const SizedBox(height: 20),

            PasswordTextField(onChanged: _updateSenha),
            const SizedBox(height: 20),

            MyCustomButton(
              textValue: _cpfValue, // Passa o valor do TextField para o botão
              onPressed: _buttonPressed, // Passa a função que será chamada no botão
            ),
            
            

             
          ],
        ),
      )
        
    );
  }


}

void makeLoginRequest(context, String cpf, String senha) async {

  debugPrint("makeLoginRequest");
  final networkManager = NetworkManager();  
  try {
    final response = await networkManager.put(
      "/login", 
      body: {
        "cpf":cpf,
        "senha": senha
      },
    );

    debugPrint('response updated successfully: $response');        
    final pessoa = MinhaPessoa.fromJson(response);
    debugPrint(pessoa.usuario!.cpf);

    debugPrint("redirect to another widget view");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MenuPrincipalWidget()));
    
  } catch (e) {
    // Handle errors
    debugPrint('Failed to handle request: $e');
    //if (context.mounted) {
      showAlertDialog1(context, e.toString());
    //}
  }

}

// separar

class CpfTextField extends StatelessWidget {
  final Function(String) onChanged;

  const CpfTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    String textoInicial = "";
    if (kDebugMode) { textoInicial = "59936878949"; }
    
    return 
    Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: 
      TextFormField(
        initialValue: textoInicial,
        onChanged: (value) {
          // Passa o valor do TextField para o widget pai
          onChanged(value);
          debugPrint("value: $value");
        },
        decoration: InputDecoration(
          labelText: 'CPF',
          focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),     
                borderRadius: BorderRadius.circular(10),           
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(10),
            ),
        ),
      )
    );
  }
}


class PasswordTextField extends StatelessWidget {
  final Function(String) onChanged;

  const PasswordTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    String textoInicial = "";
    if (kDebugMode) { textoInicial = "gdv01922"; }
    
    return 
    Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: 
      TextFormField(
        initialValue: textoInicial,
        obscureText: true,
        onChanged: (value) {
          // Passa o valor do TextField para o widget pai
          onChanged(value);
          debugPrint("value: $value");
        },
        decoration: InputDecoration(
          labelText: "Senha",
          focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),     
                borderRadius: BorderRadius.circular(10),           
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(10),
            ),
        ),
      )
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final String textValue;
  final VoidCallback onPressed;

  const MyCustomButton({super.key, required this.textValue, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Chama a função passada pelo widget pai
      child: const Text('Consultar'), // Exibe o valor atualizado
    );
  }
}