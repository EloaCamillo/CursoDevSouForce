import { LightningElement } from 'lwc';

export default class Templatestrueorfalse extends LightningElement {

    connectedCallback(){
       /* this.verdadeiro = true ;
        this.falso = false;*/

        //Criar uma lista
        this.data = [
            {name: 'Eloá Camillo'},
            {name: 'Renato Augusto'},
            {name: 'Cantillo'},
            {name: 'Fábio Santos'}
        ]


    }
}