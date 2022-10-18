import { LightningElement, api, track } from 'lwc';
//Responsavel por ser a controller e o herlper

export default class CardTicketLwc extends LightningElement {
    //Meu componente da página de conta querendo passar info para cá(componente pai da tela conseguir passar info)
    @api recordId;
    @track mensagem;

    //Se refere ao ciclo de vida de um componente LWC
    connectedCallback(){
        window.console.log(this.recordId);
        this.mensagem = 'Olá Mundo';

    }
     handleClick(event){
        this.mensagem = 'Você clicou no botão'
     }
}