public with sharing class GarrafaPower extends Garrafa {
    public GarrafaPower() {
        TipodeGarrafa = 'Inversa';
    }

    public override void abrirGarrafa(){
        System.debug('Pressione a tampa');
        System.debug('Gire a tampa para direita');
    }
}