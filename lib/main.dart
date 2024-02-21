import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Meu primeiro App",
    home: PaginaPrincipal(),
  ));
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Home Page"),
            centerTitle: true,
            titleTextStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.black),
        body: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                hintText: "Digite o seu login",
              ),
            ),
            Text("Matheus é o melhor professor"),
            Text("Matheus é o melhor professor"),
            Text("Matheus é o melhor professor"),
          ],
        ));
  }
}
