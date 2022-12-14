@IsTest
public with sharing class ReceitaAPIMock implements HttpCalloutMock {

    private Integer statusCode;
    private String statusResponse;
   
    public ReceitaAPIMock(Integer statusCode, String statusResponse){
        this.statusCode = statusCode;
        this.statusResponse = statusResponse;
        
    }

    
    //Por estar usando uma interface, parametro é a requisição
    public HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setStatusCode(this.statusCode);
        
        response.setBody ('{"atividade_principal":[{"text":"Atividades de televisão aberta","code":"60.21-7-00"}],"data_situacao":"03/11/2005","tipo":"MATRIZ","nome":"GLOBO COMUNICACAO E PARTICIPACOES S/A","uf":"RJ","telefone":"(21) 2155-4551/ (21) 2155-4552","atividades_secundarias":[{"text":"Produção de filmes para publicidade","code":"59.11-1-02"},{"text":"Atividades de produção cinematográfica, de vídeos e de programas de televisão não especificadas anteriormente","code":"59.11-1-99"},{"text":"Serviços de mixagem sonora em produção audiovisual","code":"59.12-0-02"},{"text":"Distribuição cinematográfica, de vídeo e de programas de televisão","code":"59.13-8-00"},{"text":"Atividades de gravação de som e de edição de música","code":"59.20-1-00"},{"text":"Programadoras","code":"60.22-5-01"},{"text":"Consultoria em tecnologia da informação","code":"62.04-0-00"},{"text":"Portais, provedores de conteúdo e outros serviços de informação na internet","code":"63.19-4-00"},{"text":"Outras sociedades de participação, exceto holdings","code":"64.63-8-00"},{"text":"Atividades de consultoria em gestão empresarial, exceto consultoria técnica específica","code":"70.20-4-00"},{"text":"Atividades de intermediação e agenciamento de serviços e negócios em geral, exceto imobiliários","code":"74.90-1-04"},{"text":"Aluguel de outras máquinas e equipamentos comerciais e industriais não especificados anteriormente, sem operador","code":"77.39-0-99"},{"text":"Gestão de ativos intangíveis não-financeiros","code":"77.40-3-00"},{"text":"Produção musical","code":"90.01-9-02"},{"text":"Produção e promoção de eventos esportivos","code":"93.19-1-01"}],"qsa":[{"qual":"10-Diretor","nome":"JORGE LUIZ DE BARROS NOBREGA"},{"qual":"10-Diretor","nome":"MARCELO LUIS MENDES SOARES DA SILVA"},{"qual":"10-Diretor","nome":"PAULO DAUDT MARINHO"},{"qual":"10-Diretor","nome":"ERICK DE MIRANDA BRETAS"},{"qual":"10-Diretor","nome":"PEDRO BORGES GARCIA"},{"qual":"10-Diretor","nome":"MANUEL LUIS ROQUETE CAMPELO BELMAR DA COSTA"},{"qual":"10-Diretor","nome":"CLAUDIA FALCAO DA MOTTA"},{"qual":"10-Diretor","nome":"RAYMUNDO COSTA PINTO BARROS"},{"qual":"10-Diretor","nome":"MANZAR GOMES FERES"},{"qual":"10-Diretor","nome":"RICARDO CAPILLE WADDINGTON"}],"situacao":"ATIVA","bairro":"JARDIM BOTANICO","logradouro":"R LOPES QUINTAS","numero":"303","cep":"22.460-901","municipio":"RIO DE JANEIRO","porte":"DEMAIS","abertura":"31/01/1986","natureza_juridica":"205-4 - Sociedade Anônima Fechada","fantasia":"TV/REDE/CANAIS/G2C+GLOBO SOMLIVRE GLOBO.COM GLOBOPLAY","cnpj":"27.865.757/0001-02","ultima_atualizacao":"2021-10-22T23:17:45.928Z","status":"' + statusResponse + '","complemento":"","email":"","efr":"","motivo_situacao":"","situacao_especial":"","data_situacao_especial":"","capital_social":"6983568523.86","extra":{},"billing":{"free":true,"database":true}}');
       

        return response;
    }

}
