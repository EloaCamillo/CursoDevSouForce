public with sharing class ConceitoApex {
    private final string conceito = 'Conceito Apex';
    public ConceitoApex() {
        this('Novo');

    }
    public ConceitoApex(String conceito) {
        this.conceito = conceito;

    }

    public void fazerPizza (Object pizza)
    {
        Boolean isPizza = pizza instanceof Pizza;
    }
    public class PizzaException extends Exception{}

  
}