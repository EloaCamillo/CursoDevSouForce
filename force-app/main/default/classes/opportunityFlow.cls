public with sharing class opportunityFlow {
    @InvocableMethod(label='Opportunity Flow' description = 'Run Opportunity flow by apex')//Para o flow enxergar
    public static void execute(List<id> ids) {
    List<Opportunity> listaacc = [select id, name from Opportunity where id in : ids];
        //Regra de negócio
        System.debug(listaacc);

    }
}