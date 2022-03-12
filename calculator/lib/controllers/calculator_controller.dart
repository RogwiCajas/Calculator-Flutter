import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///Estados
class CalculatorController extends GetxController {
  var firstNumber = '10'.obs;
  var secondNumber = '20'.obs;
  var mathResult = '30'.obs;
  var operation = '+'.obs;

  //utils

  //Todos los métodos relacionados a cambios de estado y operaciones
  resetAll() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '+';
  }

  addNumber(String number) {
    if (mathResult.value == '0') return mathResult.value = number;

    if (mathResult.value == '-0') {
      return mathResult.value = '-' + number;
    }
    mathResult.value = mathResult.value + number;
  }

  deleteLast() {
    if (mathResult.value.replaceAll('-', '').length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  changeNegativePositive() {
    if (mathResult.value.startsWith('-')) {
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }

  addDecimalPoint() {
    if (mathResult.value.contains('.')) return;
    if (mathResult.value.startsWith('0')) {
      return mathResult.value = '0.';
    } else {
      return mathResult.value = mathResult.value + '.';
    }
  }

  selectOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value = '0';
  }

  calculate() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case '+':
        mathResult.value = '${num1 + num2}';
        break;
      case '/':
        mathResult.value = '${num1 / num2}';
        break;
      case 'X':
        mathResult.value = '${num1 * num2}';
        break;
      case '-':
        mathResult.value = '${num1 - num2}';
        break;
      default:
        break;
    }
  }
}
