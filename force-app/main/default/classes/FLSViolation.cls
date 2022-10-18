@RestResource(urlMapping ='/fls/account/*')
global class FLSViolation {
    @HttpPost
   global static Id setAccount(String name, String phone){

    Id accountId;
    if(Schema.SObjectType.Account.fields.Phone.isCreateable()){
        Account account = new Account(Name =  name, Phone = phone);
        insert account;

    }else{
        RestContext.response.statusCode = 403;
    }
//Faz com q insira mesmo tendo permissao só para escrita
    /*Account account = new Account(Name =  name, Phone = phone);
    insert account;
    return account.id;*/
    return accountId;
   }
}