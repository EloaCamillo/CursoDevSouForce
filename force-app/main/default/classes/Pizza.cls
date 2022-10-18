public abstract with sharing class Pizza {
   private Integer QuantidadedeSabores{get;set;}

   public Pizza(Integer quantidadedeSabores){
    this.QuantidadedeSabores = quantidadedeSabores;
   }

   public abstract List<String> ingredientes();

   public void prepararPizza(){
    for (String ingrediente : ingredientes()) {
    
        System.debug(ingrediente);
    }


   }
   

}