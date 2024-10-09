import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/my_alert_dialog.dart';
import 'package:flutter_resenha/components/my_network_manager.dart';
import 'package:flutter_resenha/model/minha_pessoa.dart';
import 'package:flutter_resenha/views/menu_principal.dart';
import 'package:get/get.dart';

class LoginGetxController extends GetxController {
  RxString nomeValor = "".obs;
  RxString senhaValor = "".obs;
  RxBool loading = false.obs;
}

class LoginViewGetxFull extends StatelessWidget {
  
  const LoginViewGetxFull({super.key});
  
  @override
  Widget build(BuildContext context) {

  LoginGetxController loginGetxController = Get.put(LoginGetxController());
;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Resenhas'),
        backgroundColor: Colors.yellow,
      ),

      body: Center(
        child: 
            Obx(()=>
              Center(
                child: loginGetxController.loading.value ? 
                const LoadingShow(): 
                const LoginScreen(),
              )              
            ),

       )
    );
  }


}

class LoadingShow extends StatelessWidget {
  const LoadingShow({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    const Column(children: [
                  SizedBox(height: 200),                  
                  CircularProgressIndicator(),
                  Text("Carregando"),
                ]);
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return 
    const Center(
        child: Column(
          children: [

            SizedBox(height: 20),
            HorseImage(),
            
            CpfTextField(),
            SizedBox(height: 20),
            
            PasswordTextField(),
            SizedBox(height: 20),
            
            MyRequestButton(),
             
          ],
        ),
       );

  }
}

class HorseImage extends StatelessWidget {
  const HorseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("_assets_/resenha_2.png", 
              height: 200, 
              width: 150,
              fit: BoxFit.contain,
            );
  }
}


void makeLoginRequest(BuildContext context, String cpf, String senha) async {

  debugPrint("makeLoginRequest");

  LoginGetxController loginGetxController = Get.put(LoginGetxController());
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

    var meuNome = pessoa.usuario?.nome ?? "--";
    var meuCpf = pessoa.usuario?.cpf ?? "---";

    debugPrint('loginGetxController.loading.value v1: ${loginGetxController.loading.value}');
    loginGetxController.loading.value = false;
    debugPrint("redirect to another widget view v3");
    debugPrint('loginGetxController.loading.value v1: ${loginGetxController.loading.value}');
    loginGetxController.update();
    Get.to(()=> MenuPrincipalWidget(nome: meuNome, cpf: meuCpf));
        
  } catch (e) {
    loginGetxController.loading.value = false;
    loginGetxController.update();
    debugPrint('Failed to handle request v0: $e');
    showBasicGetxDialog(e.toString());
    
  }

}


class CpfTextField extends StatelessWidget {

  const CpfTextField({super.key});

  @override
  Widget build(BuildContext context) {
    String textoInicial = "";
    if (kDebugMode) { textoInicial = "59936878949"; }
    
    LoginGetxController loginGetxController = Get.put(LoginGetxController());

    return 
    Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: 
      TextFormField(
        initialValue: textoInicial,
        onChanged: (value) {
          loginGetxController.nomeValor.value = value;
          debugPrint("valueCpf: $value");
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
  
  const PasswordTextField({super.key});


  @override
  Widget build(BuildContext context) {

    final LoginGetxController loginGetxController = Get.put(LoginGetxController());

    String textoInicial = "";
    if (kDebugMode) { textoInicial = "gdv01922"; }
    
    return 
    Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: 
      TextFormField(
        
        initialValue: textoInicial,
        obscureText: true,
        onChanged: (value) {
          loginGetxController.senhaValor.value = value;
          debugPrint("valuesenha: $value");
          debugPrint('valuesenha v2: ${loginGetxController.senhaValor.value}');
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

class MyRequestButton extends StatelessWidget {
  
  const MyRequestButton({super.key});
    
  @override
  Widget build(BuildContext context) {

    final LoginGetxController loginGetxController = Get.put(LoginGetxController());

    return ElevatedButton(
      onPressed: () {
        loginGetxController.loading.value = true;
        debugPrint('Botão pressionado com texto v1: ${loginGetxController.senhaValor}');
        makeLoginRequest(context, loginGetxController.nomeValor.value, loginGetxController.senhaValor.value);
      }, // Chama a função passada pelo widget pai
      child: const Text('Consultar'), // Exibe o valor atualizado
    );
  }
}