@IsTest
public with sharing class ApiReceitaTest {
    @IsTest
    //testar cenario que retorna 200
    static void testCallApi200Response(){
        Test.startTest();
            String cnpj = '12345679822';
            Test.setMock(HttpCalloutMock.class, new ReceitaAPIMock(200, 'OK'));
            TOReceitaAPI responseTO = ApiReceita.callReceitaAPI(cnpj);
            System.assert(responseTO.status != 'ERROR');
        Test.stopTest();
    }

    @IsTest
    //testar cenario que retorna 429
    static void testCallApi429Response(){
        Test.startTest();
            String cnpj = '12345679822';
            Test.setMock(HttpCalloutMock.class, new ReceitaAPIMock(429, 'ERROR'));
            TOReceitaAPI responseTO = ApiReceita.callReceitaAPI(cnpj);
            System.assert(responseTO.status == 'ERROR');
        Test.stopTest();
    }

}
