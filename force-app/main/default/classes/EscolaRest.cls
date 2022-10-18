@RestResource(urlMapping = '/Escola')
global with sharing class EscolaRest {
    @httpGet
    global static List<Escola__c>getEscolas() {
        return [SELECT Id, 	Name, Idioma__c, Valor_por_semana_part_time__c, Valo__c from Escola__c];

    }
    @httpPost 
    global static Escola__c insertEscola(Escola__c escola){
        //Pode ser feito qualquer operação depende da regra de negócio

        insert escola;
        return escola;
    }

    @httpPut
    global static Escola__c upsertEscola(Escola__c escola){
        //Pode ser feito qualquer operação depende da regra de negócio

        upsert escola;
        return escola;
    }

    @httpPatch
    global static Escola__c updateEscola(Escola__c escola){
        //Pode ser feito qualquer operação depende da regra de negócio

        update escola;
        return escola;
    }
    @httpDelete
    global static boolean deleteEscola(){
        try{
        Id idEscola = (Id)RestContext.request.params.get('Id');
        //Uma vez que tenho o id posso criar uma instancia da minha escola, e vou especificar o id que eu recebi como id escola
        Escola__c escolaToDelete = new Escola__c(Id = idEscola);
        
        delete escolaToDelete;
        return true;
        }catch(Exception ex){
            return false;
        }

    }



}