import 'package:flutter/material.dart';

class MyImageButton extends StatelessWidget {
  
  final dynamic nomeBotao;
  final VoidCallback? onPressed; // Add this line

  const MyImageButton({
      super.key, 
      required this.nomeBotao,
      this.onPressed
    });

  

  @override
  Widget build(BuildContext context) {
    return 

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
        
        // Replace the entire onPressed with this:
        onPressed: onPressed ?? () {
          debugPrint("botao clicado, mas sem ação disponivel v1");
        },

        /*
        onPressed: () {
          debugPrint("redirect to another widget view v0");
          
          if (nomeBotao == MyStrings.pesquisa) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PesquisasWidget()));
          } else if (nomeBotao == MyStrings.resenhaVirtualEquideos) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResenhaOpcoesView()));
          
          } else {
            debugPrint("sem ação disponivel v1");
          }
                   
        }, 
        */

        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 10),
              Text(nomeBotao),     
            ],
          ),
        ),
      )
    );

  }
}