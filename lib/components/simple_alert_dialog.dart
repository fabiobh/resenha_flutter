import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showBasicGetxDialog(String mensagem) {
  Get.dialog(
    AlertDialog(
      title: const Text('Alerta'),
      content: Text(mensagem),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () => Get.back(),
        ),
      ],
    ),
  );

}