import 'package:flutter/material.dart';
import 'class/Pessoa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Imc.dart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora Imc.dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAltura = TextEditingController();

  String _resultado = '';

  void _calcularImc() {
    String nome = _controllerNome.text;
    double peso = double.tryParse(_controllerPeso.text.replaceAll(',', '.')) ?? 0;
    double altura = double.tryParse(_controllerAltura.text.replaceAll(',', '.')) ?? 0;

    if (nome.isNotEmpty && peso > 0 && altura > 0) {
      Pessoa pessoa = Pessoa(nome, peso, altura);
      String resultado = pessoa.printResult();
      _resultado = resultado;
    } else {
      _resultado = "Por favor, insira valores válidos para nome, peso e altura.";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controllerNome,
              decoration: const InputDecoration(
                hintText: 'Digite seu nome',
              ),
            ),
            TextField(
              controller: _controllerPeso,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Insira seu peso em kg',
              ),
            ),
            TextField(
              controller: _controllerAltura,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Insira sua altura em metros',
              ),
            ),
            ElevatedButton(
              onPressed: _calcularImc,
              child: const Text('Calcular Imc.dart'),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
