class Imc{

  double altura;
  double peso;


  Imc(this.peso, this.altura);
  double calculaImc() {
    return peso / (altura * altura) ;
  }


  String returnResult(){

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
    return("o seu imc é  ${imc.toStringAsFixed(2)}. avaliação.: $condicao");
  }
}