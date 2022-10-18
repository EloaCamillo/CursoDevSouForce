@IsTest

public class AccountTriggerHelperTest {

    @IsTest
    static void formatPhoneTest(){
        
        Account acc = new Account(Name = 'Acc Teste', Phone = '11998600214');
        
        Test.startTest();
        AccountTriggerHelper.formatPhone(acc);
        //Validar se a saida foi de acordo
        System.assertEquals(acc.Phone, '(11)99860-0214');
        Test.stopTest();
    }

}