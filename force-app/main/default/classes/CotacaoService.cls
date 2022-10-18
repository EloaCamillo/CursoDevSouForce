public with sharing class CotacaoService {
 //Método que vai fazer uso do nosso http, httpresponse e request
 private final static String serviceUrl = 'https://economia.awesomeapi.com.br/json/daily/{origem}-BRL/1';

 public static List<Cotacao> getCotacao(String moedaOrigem){
    String endPoint =  serviceUrl.replace('{origem}', moedaOrigem);

    //Conexão http
    Http http = new Http();
    //http precisa de um corpo(que vai fazer a chamada)
    HttpRequest request = new HttpRequest();
    request.setEndpoint(endPoint);
    request.setMethod('GET');
    request.setTimeout(12000);
    //Adicionando parametros ao header da requisição
    request.setHeader('Content-Type', 'application/json');

    //Criar o retorno
    HttpResponse response  = http.send(request);

    //Valida se o status code veio 200
    if(response.getStatusCode() == 200){
        String jsonString =  response.getBody();
        
        return Cotacao.parse(jsonString);
    }else{
        Map<String,Object> error = new Map<String, String>();
        error.put('statusCode', response.getStatusCode());
        error.put('status', response.getStatus());
        error.put('body', response.getBody());
        
        throw new CotacaoServiceException(JSON.serialize(error));

    }

  


 }
 public void test(){
    List<Cotacao> result =CotacaoService.getCotacao('USD');
    System.debug(result);

 }
   //Gerar exceção com o status do erro
   public class CotacaoServiceException extends Exception{}

}