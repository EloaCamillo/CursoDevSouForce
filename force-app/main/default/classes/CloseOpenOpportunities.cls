public with sharing class CloseOpenOpportunities implements Database.Batchable<sObject> {
    public CloseOpenOpportunities() {

    }

    //Preciso colocar 3 métodos
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query='SELECT Id, StageName FROM Opportunity WHERE lastModifiedDate <= last_n_days : 1 AND StageName != \'Closed\'';
        return Database.getQueryLocator(query);
    }

    //Separa em execuções  o scope vem com o conjunto de dados de acordo com a execução

    public void execute(Database.BatchableContext BC, List<sObject> scope){
        List<Opportunity> opps = new List<Opportunity>();

        for(sObject obj : scope){
            Opportunity opp = (Opportunity) obj;

            opp.StageName = 'Closed';

            opps.add(opp);
        }

        update opps;

    }

    public void finish(Database.BatchableContext BC){

    }
}