
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_resenha/components/custom_image_button.dart';
import 'package:flutter_resenha/views/login.dart';
//import 'package:flutter_resenha/views/toogle_password.dart';
//import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:get/instance_manager.dart';

import '../constants/my_constants.dart';

import '../views/pesquisas.dart';
import '../views/resenha_opcoes.dart';
import '../views/requisicao_exames.dart';

import '../views/cadastro1.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset("_assets_/resenha_2.png", 
            height: 200, 
            width: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Text(
            'Equideos',
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),

          const SizedBox(height: 20),
          MyImageButton(
            nomeBotao: "Login8",
            onPressed: () => Get.to(() => LoginViewGetxFull()),            
          ),

          const SizedBox(height: 20),
          MyImageButton(
            nomeBotao: MyStrings.resenhaVirtualEquideos,
            onPressed: () => Get.to(() => ResenhaOpcoesView()),
          ),
          
          const SizedBox(height: 20),
          MyImageButton(
            nomeBotao: MyStrings.pesquisa,
            //onPressed: () => Get.to(RequisicaoExamesWidget()),
            onPressed: () => Get.to(() => PesquisasWidget()),            
          )


          ],
        ),
      );
  }
}


