import { LightningElement, api, track, wire } from 'lwc';
//import getDado from '@salesforce/apex/lookupfieldController.getObjectDetails';

export default class CardTicketLwcs extends LightningElement {

    //  //Meu componente da página de conta querendo passar info para cá(componente pai da tela conseguir passar info)
    //  @api recordId;
    //  @api objectApiName;
    //  @track data;
    //  @track mensagem;
    //  //Outra forma de pegar dado, passo os paramatros que minhafunção espera
    //  @wire(getDado, {ObjectName:'$objectApiName'})
    //  //nome para minha propriedade
    //  //record;

    //  record({error, data}){
    //     if(error){
    //         window.console.log(error);
    //     }else{
    //         this.data = data;
    //     }
    //  }
 
    //  //Se refere ao ciclo de vida de um componente LWC
    //  connectedCallback(){
    //      window.console.log(this.recordId);
    //      this.mensagem = 'Olá Mundo';
 
    //  }
    //   handleClick(event){
    //      this.mensagem = 'Você clicou no botão'
    //   }
}