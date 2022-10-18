public class AccountTriggerHandler {

    public static void onBeforeInsert(List < Account > newAccountList, Map < Id, Account > newAccoutMap) {
        //Validar um campo de telefone

        for (Account newAccount: newAccountList) {
            if (newAccount.Phone == null) {
                newAccount.addError('Por favor informar o telefone');

            } else if (newAccount.Phone.length() < 11) {
                newAccount.addError('Por favor informar o telefone com o ddd');
            } else {
                AccountTriggerHelper.formatPhone(newAccount);

            }

        }
    }
    //Preciso do id para fazer o vinculo da oportunidade com a conta

    public static void onAfterInsert(List<Account> newAccountList, Map<Id,Account> newAccountMap)       
        {

          List<String> travelAccountList = new List<String>();

      
        for (Account newAccount : newAccountList) {
            if(newAccount.RecordTypeId == Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Travel_Detail').getRecordTypeId()){
                travelAccountList.add(newAccount.Id);
                //Quando não for future ou batch é possivel executar(para não disparar um future dentro de outro future)
               /* if(!System.isFuture() && !System.isBatch()){
                    //Chama o método
                    TravelAccountHelper.fillAdress(newAccount.id);

                }*/
              

            }
     

            System.enqueueJob(new TravelAccountQueueable(newAccountList));
            //Para o mátodo future
            // if(!System.isFuture() && !System.isBatch()){
            // (new TravelAccountHelper()).createOpportunities(travelAccountList);
            // }
          

        }
    }


}