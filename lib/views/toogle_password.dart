import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ToogleController extends GetxController {
  var isPasswordHideen = true.obs;



}

class TogglePassworView extends GetView<ToogleController> {
  const TogglePassworView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Resenhas'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(children: [
        const Text("---"),
        Obx(()=>
            TextField(
              obscureText: controller.isPasswordHideen.value,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Senha",
                suffix: InkWell(
                  child: const Icon(Icons.visibility, color: Colors.blue, size: 20),
                  onTap: (){
                    controller.isPasswordHideen.value = !controller.isPasswordHideen.value;
                  },
                )
              ),
            )
          )
      ],) 
    );
  }

}