//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/custom_image_button.dart';
import 'package:flutter_resenha/views/requisicao_exames.dart';

class PesquisasWidget extends StatelessWidget {
  const PesquisasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisas'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/resenha_2.png", 
              height: 200, 
              width: 150,
              fit: BoxFit.contain,
            ),
            
            const SizedBox(height: 50,),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:  ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: const BorderSide(color: Colors.grey),
                    )
                  )
                ),
                onPressed: () {
                  debugPrint("redirect to requisicaoExames");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RequisicaoExamesWidget()));
                }, 
                child:  const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text("Pesquisa Requisição de Exames"),
                    ],
                  ),
                ),
              )
            ),

            const SizedBox(height: 20),

            const MyImageButton(nomeBotao: 'Pesquisa Requisição de Exames'),
            const SizedBox(height: 10),

            const MyImageButton(nomeBotao: 'Pesquisa Requisição de Exames 2'),
            const SizedBox(height: 10),

            const MyImageButton(nomeBotao: 'sdsd'),
            const SizedBox(height: 10),


             
          ],
        ),
      )
      

        
    );
  }
}


