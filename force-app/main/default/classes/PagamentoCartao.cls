public with sharing class PagamentoCartao implements IPagamento{
    public PagamentoCartao() {

    }

   public Decimal cobrar(Decimal valorCompra, Decimal valorPago){
       //Toda regra de negócio e Pagamento
     
           return valorPago - valorCompra;
       
   }
}