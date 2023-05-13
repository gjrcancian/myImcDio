import 'package:test/test.dart';
import '../bin/my_imc_dio.dart';


  void main() {

      test ('calcula o Imc da Pessoa', () {
        var pessoa = Pessoa("João", 92 , 1.85);
        var imc = pessoa.calculaImc();
        // O valor esperado é calculado manualmente: peso / (altura * altura)
        expect(imc, closeTo(26.88, 0.01)); // Aqui estamos permitindo uma pequena margem de erro, pois estamos trabalhando com números de ponto flutuante
      });

      test('Verificando se esta retornando o valor correto', () {
        var pessoa = Pessoa("PAo", 70.0, 1.75);
        var resultado = pessoa.printResult();
        expect(resultado, startsWith("Olá PAo seu peso é 70.0, a sua altura é 1.75 e o seu imc é 22.857142857142858. avaliação.: Excelente, você é saudavel!"));
      });
  }