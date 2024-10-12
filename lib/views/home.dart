
import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/custom_image_button.dart';
import 'package:flutter_resenha/views/login.dart';
//import 'package:flutter_resenha/views/toogle_password.dart';
//import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:get/instance_manager.dart';

import '../constants/my_constants.dart';

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
          const MyLoginButtonWidget(),

          const SizedBox(height: 50),
          const MyImageButton(nomeBotao: MyStrings.resenhaVirtualEquideos),
          
          const SizedBox(height: 20),
          const MyImageButton(nomeBotao: MyStrings.pesquisa),

          ],
        ),
      );
  }
}

List<Widget> get myHome {
  return <Widget>[
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
        const MyLoginButtonWidget(),

        const SizedBox(height: 50),
        const MyImageButton(nomeBotao: MyStrings.resenhaVirtualEquideos),
        
        const SizedBox(height: 20),
        const MyImageButton(nomeBotao: MyStrings.pesquisa),
                                
      ];
}



class MyLoginButtonWidget extends StatelessWidget {
  const MyLoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          debugPrint("redirect to another widget view v1");
          
          // widget de Login antigo sem GetX
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginViewFull())); 
          
          // login novo COM GetX
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginViewGetxFull()));
                    
          //Get.to(()=> const LoginViewGetxFull());
        }, 

        child: const SizedBox(
          height: 40,
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 10),
              Text("Login4"),     
            ],
          ),
        ),
      )
    );
  }
}
