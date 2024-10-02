import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/my_image_button.dart';
import 'package:flutter_resenha/constants/my_constants.dart';
//import 'package:flutter_resenha/views/requisicao_exames.dart';

class ResenhaOpcoesView extends StatelessWidget {
  const ResenhaOpcoesView({super.key});

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
            
            const SizedBox(height: 50,),            
            const MyImageButton(nomeBotao: MyStrings.cadastrarNovaResenha),
            
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