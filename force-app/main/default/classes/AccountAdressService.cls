public with sharing class AccountAdressService {

        //Declarar para chamar dentro de um webcomponent
        @AuraEnabled(continuation = true cacheable = true)
        public static Object beginSearchAddress(String zipCode){

        //Limite máximo de timeout 120 segundos
            Continuation con = new Continuation(120);
            //Método que vai utilizar para fazer a volta do continuation
            con.ContinuationMethod = 'endSearchAddress';
            HttpRequest request =new HttpRequest();
            request.setMethod('GET');
            request.setEndpoint('https://viacep.com.br/ws/'+zipCode+'/json/');
            con.addHttpRequest(request);

            return con;
           
        }
        @AuraEnabled(cacheable = true)
        //labels que foram criadas da minha chamada do continuation
              public static Map<String,Object> endSearchAddress(List<String> labels, Object state){
                //Quando já chamou o serviço e já teve a resposta
                HttpResponse response = Continuation.getResponse(labels[0]);

                return(Map<String,Object>)JSON.deserializeUntyped(response.getBody());
           
        }
    }