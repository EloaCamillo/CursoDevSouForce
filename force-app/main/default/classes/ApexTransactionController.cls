public with sharing class ApexTransactionController {
    public static void saveAccount() {
        System.debug('Método Start');
       
        //Inserir uma conta
        Account account = new Account(Name ='Aprx Transaction Acc', Phone = '111111111');
        insert account;
        Contact contact = new Contact(Account = account, LastName = 'Test Insert Transaction');
        insert contact;
        Case caseAccount = new Case(Account = account, Subject = 'Test Apex Transaction Case');
        insert caseAccount;

        System.debug('Méthod Finished');

    }
}