public virtual with sharing class Garrafa {
    
    protected String TipodeGarrafa;
   
    public Garrafa() {
    TipodeGarrafa = 'Padrão';
    }
    
    public virtual void abrirGarrafa(){
        System.debug(TipodeGarrafa);
        if(TipodeGarrafa=='Padrão'){
        System.debug('Gire a tampa para a esquerda');
        }
    }

}