import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_resenha/components/custom_image_button.dart';
import 'package:flutter_resenha/constants/my_constants.dart';
import 'package:flutter_resenha/views/cadastro1.dart';
import '../views/requisicao_exames.dart';

class ResenhaOpcoesView extends StatelessWidget {
  const ResenhaOpcoesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resenhas1'),
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
            
            const SizedBox(height: 50,),            
            MyImageButton(
              nomeBotao: MyStrings.cadastrarNovaResenha,
              onPressed: () => Get.to(() => ResenhaCadastro1()),
              //onPressed: () => Get.to(RequisicaoExamesWidget()),              
            ),
            
            const SizedBox(height: 5),
            const MyImageButton(nomeBotao: MyStrings.verResenhasCadastradas),
            
            const SizedBox(height: 5),
            const MyImageButton(nomeBotao: MyStrings.importarResenha),
             
          ],
        ),
      )
      

        
    );
  }

  


}