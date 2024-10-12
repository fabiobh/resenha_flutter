import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/database_help.dart';
import 'package:flutter_resenha/components/simple_alert_dialog.dart';
import 'package:flutter_resenha/components/dbcore.dart';
import 'package:flutter_resenha/components/network_manager.dart';
import 'package:flutter_resenha/constants/my_constants.dart';
import 'package:flutter_resenha/model/minha_pessoa.dart';
import 'package:flutter_resenha/views/menu_principal.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

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

  createAllTables();

/*

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
    var meuToken = pessoa.usuario?.token ?? "-";

    salvarDadosUsuario(meuCpf, meuToken);

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
*/
}

void createAllTables() {
  createTable(DBCore.scriptCreateTableDataAtualizacaoTabAux());
  createTable(DBCore.scriptCreateTableUsuario());
  createTable(DBCore.scriptCreateTableGtaEmitida());
  createTable(DBCore.scriptCreateTableDestinoTop10());
  createTable(DBCore.scriptCreateTableResUsuario());
  createTable(DBCore.scriptCreateTableResRaca());
  createTable(DBCore.scriptCreateTableResPelagem());
  createTable(DBCore.scriptCreateTableResRacaPelagem());
  createTable(DBCore.scriptCreateTableResStPelagem());
  createTable(DBCore.scriptCreateTableResComposicaoPelagem());
  createTable(DBCore.scriptCreateTableResDados());
  createTable(DBCore.scriptCreateTableResFotos());
  createTable(DBCore.scriptCreateTableResMarcas());
}


void createTable(String sqliteQuery) async {

  Database? db = await DatabaseHelper.instance.database;
  //var aaaaaaa = DatabaseHelper.instance.database;
  
  await db?.transaction((txn) async {
    try {      
      await txn.execute(sqliteQuery);      
      /*
      await txn.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');      
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      debugPrint('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      debugPrint('inserted2: $id2');
      */
    } catch (e) {
      debugPrint("error create table Test: $e");      
    }
        
  });
  debugPrint("fim database");  

}

Future<Database> newMethod() async {
  Database db = await openDatabase('my_db.db');
  debugPrint("database my_db.db opened");
  return db;
}

Future<void> salvarDadosUsuario(String usuarioCpf, String usuarioToken) async {
  
  final prefs = await SharedPreferences.getInstance();
  
  await prefs.setString(MyStrings.usuarioCpf, usuarioCpf);
  await prefs.setString(MyStrings.usuarioToken, usuarioToken);
  final cpfSalvo = prefs.getString(MyStrings.usuarioCpf) ?? "";
  final tokenSalvo = prefs.getString(MyStrings.usuarioToken) ?? "";
  debugPrint("cpfSalvo: $cpfSalvo - tokenSalvo: $tokenSalvo");

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
      onPressed: () async {
        loginGetxController.loading.value = true;
        debugPrint('Botão pressionado com texto v1: ${loginGetxController.senhaValor}');
        makeLoginRequest(context, loginGetxController.nomeValor.value, loginGetxController.senhaValor.value);        
      }, // Chama a função passada pelo widget pai
      child: const Text('Consultar'), // Exibe o valor atualizado
    );
  }
}