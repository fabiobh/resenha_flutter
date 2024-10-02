import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/my_image_button.dart';
import 'package:flutter_resenha/constants/my_constants.dart';
//import 'package:flutter_resenha/views/requisicao_exames.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            
            const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: MyTextFieldBorderWidget()),
            const SizedBox(height: 20),

            const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: MyTextFieldBorderWidget()),




             
          ],
        ),
      )
      

        
    );
  }

  


}



class MyTextFieldBorderWidget extends StatelessWidget {
  const MyTextFieldBorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 5.0),                
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'CPF',
        ),
    );
  }
}