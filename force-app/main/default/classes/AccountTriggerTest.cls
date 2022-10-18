@IsTest
public class AccountTriggerTest {
    @IsTest
    static void testAccountInsert(){
        List<Account> accountToInsert = new List<Account>{
            new Account(Name = 'Acc 01', Phone = null),
            new Account(Name = 'Acc 02', Phone = '11998600214'),
            new Account(Name = 'Acc 03', Phone = '119986002143')
        };

        Test.startTest();
        Database.SaveResult[] insertResults = Database.insert(accountToInsert, false);
        Test.stopTest(); 

        //Começar as validações
        Database.SaveResult acc01InsertResult = insertResults[0];
        Database.SaveResult acc02InsertResult = insertResults[1];
        Database.SaveResult acc03InsertResult = insertResults[2];
       
        //Valida se o insert da minha primeira conta não teve sucesso e se o da segunda não deu erro
        System.assert(!acc01InsertResult.isSuccess() && !acc02InsertResult.isSuccess());
        //O insert da primeira conta retornou está mensagem? se sim etá certo
        System.assert(acc01InsertResult.getErrors()[0].getMessage() == 'Por favor informar o telefone');
           //O insert da segunda conta retornou está mensagem? se sim etá certo
        System.assert(acc02InsertResult.getErrors()[0].getMessage() == 'Por favor informar o telefone com o DDD');
        System.assert(acc03InsertResult.isSuccess());

        Account acc03AfterInsert = [SELECT Phone FROM Account WHERE Id =: acc03InsertResult.getId()];

        System.assert(acc03AfterInsert.Phone == '(11)99860-0214');
    }
}
