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
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: "Digite o seu login",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.password), hintText: "Digite a sua senha"),
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TelaListaDeCompras()));
                    },
                    child: const Text("Login")),
              )
            ],
          ),
        ));
  }
}

class TelaListaDeCompras extends StatefulWidget {
  const TelaListaDeCompras({super.key});

  @override
  State<TelaListaDeCompras> createState() => _TelaListaDeComprasState();
}

class _TelaListaDeComprasState extends State<TelaListaDeCompras> {
  List<Produto> listaDeProdutos = [
    Produto("Iphone 15 Pro max", 1000, "lib/images/airpods.png"),
    Produto(
        "Camisa do Timão todo poderoso", 1000, "lib/images/applevision.png"),
  ];

  List<Produto> itensComprados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Lista de compras",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: listaDeProdutos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(listaDeProdutos[index].images),
                      title: Text(listaDeProdutos[index].nome),
                      subtitle: Text(
                          " R\$ ${listaDeProdutos[index].preco.toString()}0"),
                      trailing: ElevatedButton(
                        onPressed: () {
                          itensComprados.add(listaDeProdutos[index]);
                        },
                        child: const Text('Comprar'),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopping_cart),
      ),
      bottomSheet: SizedBox(
        height: 50,
        child: Container(
          color: Colors.pink,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Preço Total",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Produto {
  String nome = "";
  double preco = 0.0;
  String images = "";

  Produto(String _nome, double _preco, String _images) {
    nome = _nome;
    preco = _preco;
    images = _images;
  }
}
