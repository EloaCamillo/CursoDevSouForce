trigger AccountTrigger on Account (before insert, after insert) {
 //Account newAccount = Trigger.new[0];//me retrona uma lista com todos os registros novos, estou pegando o primeiro
 //List<Account> newAccountList = Trigger.new;

 if(Trigger.operationType == System.TriggerOperation.BEFORE_INSERT){
    AccountTriggerHandler.onBeforeInsert(Trigger.new, Trigger.newMap);
 }

 if(Trigger.operationType == System.TriggerOperation.AFTER_INSERT){
    AccountTriggerHandler.onAfterInsert(Trigger.new, Trigger.newMap);
}

}