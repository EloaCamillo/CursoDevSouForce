public with sharing class Carro {

   public Integer CapacidadeTanque {get;set;}
   public Integer TamanhodaRoda {get;set;}
   private String TipodeCarroceria{get;set;}
   public Decimal PotenciaDoMotor{get;set;}
   public String Cor {get;set;}

    

    public Carro(String cor, String tipodeCarroceria){
        this.Cor = cor;
        this.TipodeCarroceria = tipodeCarroceria;
    }
    public Carro(Integer TamanhodaRoda){
        this.TamanhodaRoda = TamanhodaRoda;
    }

    public String getTipoCarroceria(){
        return this.TipodeCarroceria;
    }
}