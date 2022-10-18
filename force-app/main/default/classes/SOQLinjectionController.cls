public with sharing class SOQLinjectionController {

    public List<Account> account{get;set;}
    public String inputName{get;set;}
    public string Error {get;set;}

    public SOQLinjectionController() {
        account = new List<Account>();
    }

    public PageReference searchAccount(){
        //soql injection
        //String query = 'Select Id, Name, Phone From Account where Name like \'%'+ this.inputName + '%\'';

          //Fazer da forma anterior que ocorre o soql injection mas se protejendo
          String query = 'Select Id, Name, Phone From Account where Name like \'%'+ String.escapeSingleQuotes(this.inputName) + '%\'';
        

        try{
            //soql injection
           // account = DataBase.query(query);

           account = DataBase.query(query);

           //Fazer da forma anterior que ocorre o soql injection mas se protejendo

             // Uma forma de Resolucao para soql injection
           //account = [SELECT Id, Name, Phone from Account where Name like: '%'+this.inputName+'%' ];


        } catch(Exception e){
            error =  e.getMessage();

        }

        return null;
    }
}