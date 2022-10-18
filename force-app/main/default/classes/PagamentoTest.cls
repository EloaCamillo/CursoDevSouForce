@IsTest
public with sharing class PagamentoTest {
    @IsTest
    public static void pagamentoCartao() {

        PagamentoCartao pc = new PagamentoCartao();
        Decimal troco = pc.cobrar(150,150);

        System.assertEquals(0,troco);

    }

    @IsTest
    public static void pagamentoDinheiro() {

        PagamentoDinheiro pd = new PagamentoDinheiro();
        Decimal troco = pd.cobrar(200,150);

        System.assertEquals(50,troco);
        System.assertNotEquals(0,troco);

    }

    //Com a Interface
    @IsTest
  

    public static void pagamentoDinamico(){
        Decimal trocoDinheiro = receber(new PagamentoDinheiro(), 200,150);

        System.assertEquals(50, trocoDinheiro);

        Decimal trocoCartao =  receber(new PagamentoCartao(), 150, 150);

        System.assertEquals(0,trocoCartao);

    }

    public static Decimal receber(IPagamento pagamento, Decimal valorCompra, Decimal valorPago){
        return pagamento.cobrar(valorCompra,valorPago);
    }
}