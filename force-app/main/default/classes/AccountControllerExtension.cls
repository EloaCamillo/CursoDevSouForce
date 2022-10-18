public with sharing class AccountControllerExtension {

    public List<Contact> listContact{get;set;}
    public Account account {get;set;}

    public AccountControllerExtension(ApexPages.StandardController standardController) {
        this.account = standardController.getRecord() == null ? new Account(): (Account)standardController.getRecord(); //pegar o id da url para que quando clique no edit traga as infos de conta e contato
        this.listContact = new List<Contact>();

        if(this.account.Id != null){
            this.listContact = [SELECT Id, FirstName, LastName, Email from Contact where AccountId =: this.account.Id];
        }

    }

    public PageReference addContact(){
        this.listContact.add(new Contact());

        return null;

    }

    public PageReference deleteContact(){
        String index = ApexPages.currentPage().getParameters().get('index');//Metodo que retorna a instancia pagereference referente a accontpage
        this.listContact.remove(Integer.valueOf(index));
        return null;
    }
//Além de salvar a conta vai salvar o contato.
    public PageReference saveAccount(){
        upsert account;
        for(Contact contact : listContact){
           
            contact.AccountId = account.Id;
        }
        upsert listContact;
        ApexPages.StandardController controller =  new ApexPages.StandardController(account);/*reestancio eu consigo chamar o método contorller chamado view que me retorna
        o pagereference referente  a pagina detalhes da conta
        */
        return controller.view();
    }
}