public with sharing class Cotacao {
    public String code;//Moeda de Origem
    public String codein;//Moeda de destino
    public String name;//Nome da moeda
    public String high;//Maior preço do dia
    public String low;//Meno preço do dia
    public String varBid;//Variação Monetária
    public String pctChange;//Percentual da Variação
    public String bid;//Valor de Compra
    public String ask;//Valor de Venda
    public String timestamp;//Data de cotação em timestamp
    public String create_date;//Data da cotação

//Método para desearilizar o json
    public static List<Cotacao> parse(String jsonString){
        return (List<Cotacao>)JSON.deserialize(jsonString, List<Cotacao>.class);

    }
}