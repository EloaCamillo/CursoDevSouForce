@IsTest
public with sharing class CarroTest {
    @IsTest
    public void carroTest() {
    

        Carro carroPreto = new Carro('Preto', 'roxo');
        Carro Vermelho =  new Carro(20);
  
     

        System.debug(carroPreto.cor);
        System.debug(carroPreto.getTipoCarroceria());
        System.debug(Vermelho.TamanhodaRoda);
      
    }
}
