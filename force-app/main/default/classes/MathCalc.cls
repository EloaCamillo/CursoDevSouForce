public with sharing class MathCalc {
    public MathCalc() {
        //Chamo o Calculator e dentro do Calculator eu tenho o Calculator.soap

        Calculator.CalculatorSoap calc = new Calculator.CalculatorSoap();
        Integer resultAdd = calc.Add(10,10);
        System.Debug('10 + 10 = ' + resultAdd);
        System.assertEquals(resultAdd, 20);

        

    }
}