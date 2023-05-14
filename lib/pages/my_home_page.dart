import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_dio_v2/my_widgets/my_show_result.dart';

import '../class/Pessoa.dart';
import '../my_widgets/my_snack_bar.dart';
import '../my_widgets/my_text.dart';

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
      MyShowResult.show(context, resultado, 'Resultado');
    } else {
      MySnackBar.show(context, "Por favor, insira valores válidos para nome, peso e altura.");
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyText("Nome:"),
              TextField(
                controller: _controllerNome,
                decoration: const InputDecoration(
                  hintText: 'Digite seu nome',
                ),
              ),
              SizedBox(height: 20), // Espaço entre os campos
              MyText("Peso (kg):"),
              TextField(
                controller: _controllerPeso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Insira seu peso em kg',
                ),
              ),
              SizedBox(height: 20), // Espaço entre os campos
              MyText("Altura (m):"),
              TextField(
                controller: _controllerAltura,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Insira sua altura em metros',
                ),
              ),
              SizedBox(height: 20), // Espaço entre os campos
              ElevatedButton(
                onPressed: _calcularImc,
                child: const Text('Calcular IMC'),
              ),
              SizedBox(height: 20), // Espaço entre os campos
              MyText(_resultado),
            ],
          ),
        ),
      ),
    );
  }
}
