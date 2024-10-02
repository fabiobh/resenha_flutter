import 'package:flutter/material.dart';
import '../constants/my_constants.dart';
import '../views/pesquisas.dart';
import '../views/resenha_opcoes.dart';
import '../views/requisicao_exames.dart';

class MyImageButton extends StatelessWidget {
  
  final dynamic nomeBotao;
  const MyImageButton({super.key, required this.nomeBotao});

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
        
        onPressed: () {
          debugPrint("redirect to another widget view");
          if (nomeBotao == MyStrings.pesquisa) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PesquisasWidget()));
          } else if (nomeBotao == MyStrings.resenhaVirtualEquideos) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResenhaOpcoesView()));
          } else if (nomeBotao == MyStrings.resenhaVirtualEquideos) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RequisicaoExamesWidget()));            
          } else {
            debugPrint("sem ação disponivel v1");
          }          
        }, 

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