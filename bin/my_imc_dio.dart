import 'dart:io';

void main() {

  try {

    print("Olá pronto para calcular o seu imc? Sim, então, digite o seu nome...");
    String? nomeInput = stdin.readLineSync();
    if(nomeInput == null){
      print("Você não digitou nada :´(, fui ");

    }
    String? nome = nomeInput;

    print("Insira seu peso em kg:");
    String? pesoInput = stdin.readLineSync();

    pesoInput = pesoInput?.replaceAll(',', '.');

    double? peso = double.tryParse(pesoInput!);
    if (peso == null) {
      print("Erro na leitura do peso.");
      return;
    }
    print("Insira sua altura em metros:");
    String? alturaInput = stdin.readLineSync();
    alturaInput = alturaInput?.replaceAll(',', '.');
    double? altura = double.tryParse(alturaInput!);
    if (altura == null) {
      print("Erro na leitura da altura.");
      return;
    }else{
      print("A sua altura é $altura");
    }
    Pessoa user = Pessoa(nome!, peso, altura);
    String result = user.printResult();
    print(result);

  } catch (e) {
    print("Ocorreu um erro: $e");
  }
}


class Pessoa {
  String nome;
  double altura;
  double peso;

  Pessoa(this.nome, this.peso, this.altura);
  double calculaImc() {
    return peso / (altura * altura) ;
  }

  String printResult(){

   double imc = calculaImc();
   String condicao;
   if (imc < 16) {
     condicao = 'Cuidado, a sua condição é considerada como Magreza Grave!';
   } else if (imc >= 16 && imc < 17) {
     condicao = 'Cuidado, a sua condição é considerada como Magreza Moderada!';
   } else if (imc >= 17 && imc < 18.5) {
     condicao = 'A sua condição é Magreza Leve, fique em atenção!';
   }else if (imc >= 18.5 && imc < 25) {
     condicao = 'Excelente, você é saudavel!';
   }else if (imc >= 25 && imc < 30) {
     condicao = 'Você esta com um leve Sobrepeso';
   }else if (imc >= 30 && imc < 35) {
     condicao = 'Você esta com Obesidade no Grau 1';
   }
   else if (imc >= 35 && imc < 40) {
     condicao = 'Você esta com Obesidade no Grau 2(Severa)';
   }else{
     condicao = 'Você esta com Obesidade no Grau 3(Obesidade Mórbida)';
   }
   return("Olá $nome seu peso é $peso, a sua altura é $altura e o seu imc é $imc. avaliação.: $condicao");
  }
}
