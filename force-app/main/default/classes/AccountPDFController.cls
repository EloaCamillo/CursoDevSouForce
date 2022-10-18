public  class AccountPDFController {

    Id accountId;

    public AccountPDFController() {

        //Inicializar ele com o que vou pegar da minha página
        this.accountId =  ApexPages.currentPage().getParameters().get('Id');

    }

    
}