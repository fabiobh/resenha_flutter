import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_resenha/model/Album.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/23'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    debugPrint("response 200");
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    //return const Text('Loading succesful');
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    debugPrint("response fail");
    throw Exception('Failed to load album');    
  }
}

makePostRequestGedavePesquisaRequisicaoExame(inputText) async {

/*
urlBase:
https://gedave-proxyhml.agricultura.sp.gov.br/gedave/api/spservicos/v1/
https://gedave-proxyhml.agricultura.sp.gov.br/gedave/api/spservicos/v1/buscaRequisicaoExame
valor para pesquisar no G2: 2024001928002702372700062046654
valor para pesquisar no treina: 2023001928000022003740062006941
*/

  final uri = Uri.parse('https://gedave-proxyhml.agricultura.sp.gov.br/gedave/api/spservicos/v1/buscaRequisicaoExame');
  final headers = {'Content-Type': 'application/json'};
  //Map<String, dynamic> body = {'codigoBarra': "2024001928002702372700062046654"};
  Map<String, dynamic> body = {'codigoBarra': inputText};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  Response response = await put(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  int statusCode = response.statusCode;
  String responseBody = response.body;
  debugPrint("responseBody: $responseBody statusCode: $statusCode");
}

makePostRequest() async {

  final uri = Uri.parse('http://httpbin.org/post');
  final headers = {'Content-Type': 'application/json'};
  Map<String, dynamic> body = {'id': 21, 'name': 'bob'};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  int statusCode = response.statusCode;
  String responseBody = response.body;
  debugPrint("responseBody: $responseBody statusCode: $statusCode");
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
    debugPrint("class: $widget");
    controller = TextEditingController();
    futureAlbum = fetchAlbum();
    //makePostRequest();
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
                  debugPrint("errro response: ${snapshot.error}");
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
                  makePostRequestGedavePesquisaRequisicaoExame(text);
                },
              child: const MyConsultarText(),              
            ),

            
          ],
        ),
      )
      

        
    );
  }


}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

class MyConsultarText extends StatelessWidget {
  const MyConsultarText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Consultar");
  }

}