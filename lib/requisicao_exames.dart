import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_resenha/model/Album.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    debugPrint("response 200");
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    debugPrint("response fail");
    throw Exception('Failed to load album');
  }
}

class RequisicaoExamesWidget extends StatefulWidget {
  const RequisicaoExamesWidget({super.key});

  @override
  State<RequisicaoExamesWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RequisicaoExamesWidget> {
  late Future<Album> futureAlbum;
  late TextEditingController controller;
  String text = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    futureAlbum = fetchAlbum();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requisição de Exames'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text("Requisição de Exame"),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(),
              controller: controller,
            ),
                        
            const SizedBox(height: 20),
            
            FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),

            const SizedBox(height: 20),
            
            ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: const BorderSide(color: Colors.grey),
                    )
                  )
                ),
                onPressed: () {
                  setState(() {
                    text = controller.text;                    
                  });
                  debugPrint("consultar: $text");
                },
              child: const Text("Consultar"),
            ),

            
          ],
        ),
      )
      

        
    );
  }


}


