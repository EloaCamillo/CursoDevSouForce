public with sharing class AccountActivitiesSchedule implements Schedulable {
    public AccountActivitiesSchedule() {
        //Commit on Master

    }

    //Precisa do método execute
    public void execute(SchedulableContext sc){
        //Tudo que não tiver fechado e não for modificado nos ultimos dois dias vai ser criado uma oportunidade
        List<Opportunity> Opportunities = [SELECT AccountId, OwnerId FROM Opportunity WHERE LastModifiedDate <= last_n_days:2 and StageName != 'Closed'];
        List<Task> taskToInsert = new List<Task>();

        for(Opportunity opp : Opportunities){
            taskToInsert.add(
                new Task(
                    WhatId = opp.AccountId,
                    OwnerId = opp.OwnerId,
                    //Um dia para fazer a tarefa
                    ActivityDate = System.now().addDays(1).date(),
                    Subject = 'Follow-up'
                )
            );
        }
        insert taskToInsert;

    }
}
