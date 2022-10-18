import { LightningElement, api } from 'lwc';

export default class CardTicketsLwc extends LightningElement {
    
    @api vooIda;
    @api vooVolta;
    @api moeda;

    reservaHandleClick(){
        
        let vooIda = this.vooIda;
        let vooVolta = this.vooVolta;

        let compEvent = new CustomEvent('ticketEventClick',{
            detail:{
                "IdVooIda": vooIda.Id,
                "IdVooVolta": vooVolta.Id
            }
        });
        this.dispatchEvent(compEvent);
    }
    get vooIdaDiaDiferente(){
        return this.vooIda.Data_Partida__c !== this.vooIda.Data_Chegada__c;

    }

    get vooVoltaDiaDiferente(){
        return this.vooVolta.Data_Partida__c !== this.vooVolta.Data_Chegada__c;
    }

    get valorTotal(){
        return this.vooIda.Valor__c + this.vooVolta.Valor__c;
    }



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