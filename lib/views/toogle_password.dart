import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToogleController extends GetxController {
  var isPasswordHideen = true.obs;
  
}

//class PassworView extends GetView<ToogleController> {
class PassworView extends StatelessWidget {
  const PassworView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToogleController>(
      init: ToogleController(),
      builder: (controller) => Scaffold(
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
        ],
      ) 
      )
    );
  }

}