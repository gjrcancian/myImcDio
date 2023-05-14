import 'package:my_imc_dio_v2/class/Imc.dart';

class Pessoa {
  String nome;
  double altura;
  double peso;

  Pessoa(this.nome, this.peso, this.altura);
  String printResult(){
  Imc imc = Imc(peso, altura);
  String result = imc.returnResult();

  return("Olá $nome seu peso é $peso, a sua altura é $altura $result");
  }
}