import { LightningElement, api, track } from 'lwc';
import getVoos from '@salesforce/apex/TicketsController.getVoos';
import createTicket from '@salesforce/apex/TicketsController.createTicket';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';
import{loadScript} from 'lightning/platformResourceLoader';
import formatterLib from '@salesforce/resourceUrl/formatter'

export default class TicketManagerLwc extends LightningElement {
    @api recordId;
    @api moeda;
    @api modo24h;
  

    @track voo;
    @track minDate;
    @track hasResult;
    @track aeroportoOrigem;
    @track aeroportoDestino;
    @track dtPartida;
    @track dtRetorno;

    moedas =[
        {label: 'Real R$', value: "BRL"},
        {label: 'Dolar $', value: "USD"},
        {label: 'Euro ₢', value: "EUR"},
    ]
       
    

    connectedCallback(){
        this.minDate = this.getToday();
        loadScript(this, formatterLib).then(()=>{
            window.console.log('Carregado com sucesso!');

        }).catch(error =>{
            window.console.log(error);

        })

    }

    handleClick(){
       
        
        this.loadVoos(this.aeroportoOrigem, this.aeroportoDestino, this.dtPartida, this.dtRetorno);
      
        

       
    }

    handleEventClick(event){
        const idVooIda = event.detail.IdVooIda;
        const idVooVolta = event.detail.IdVooVolta;
        const recordId = this.recordId;

        this.createTicket(recordId, idVooIda, idVooVolta);
    }
   
    hanlderMoedaChange(event){
        this.moeda = event.detail.value;

    }

    lookupHandlerChange(event){
        if(event.detail.name === 'aeroportoOrigem'){
            this.aeroportoOrigem = event.detail.value;

        }else if(event.detail.name === 'aeroportoDestino'){
            
            this.aeroportoDestino = event.detail.value;

        }
    }

    handlerDataPartidaChanged(event){
        this.dtPartida = event.detail.value;

    }

    handlerDataRetornoChanged(event){
        this.dtRetorno = event.detail.value;

    }

 



    loadVoos(aeroportoOrigem, aeroportoDestino, dataPartida, dataRetorno){
        getVoos({ aeroportoOrigem: aeroportoOrigem,
            aeroportoDestino:aeroportoDestino,
            dataPartida:dataPartida,
            dataRetorno:dataRetorno

        }).then(data =>{
            
           if(this.modo24h){
            
                for(let i = 0; i< data.length; i++){
                    data[i].vooIda.Hora_de_Chegada__c = window.Formatter.format(data[i].vooIda.Hora_de_Chegada__c);
                    data[i].vooIda.Hora_de_Partida__c = window.Formatter.format(data[i].vooIda.Hora_de_Partida__c);

                    data[i].vooVolta.Hora_de_Chegada__c = window.Formatter.format(data[i].vooVolta.Hora_de_Chegada__c);
                    data[i].vooVolta.Hora_de_Partida__c = window.Formatter.format(data[i].vooVolta.Hora_de_Partida__c);

                }

            }
            this.hasResult = data && data.length;
            this.voos = data;
        

            if(!data || data.length === 0){
                this.showToast('Ops!', 'Nenhum voo encontrado com os critérios pesquisados', 'warning');
               
            }

        }).catch(error =>{
            window.console.log(error);
            this.showToast('Ops!', 'Ocorreu um erro ao processar sua solicitação', 'warning', 'error');
    })

    }

    createTicket (accountId, vooIdaId, vooVoltaId){
        createTicket({
            accountId: accountId,
            vooIdaId : vooIdaId,
            vooVoltaId : vooVoltaId
        }).then(result => {
            window.console.log(result);
            this.showToast('Sucess', 'Ticket Reseervado com sucesso', 'sucess');

        }).catch(error =>{
            window.console.error(error);
            this.showToast('Ops!', 'Ocorreu um erro ao processar sua solicitação', 'error');


        });

    }






    getToday(){
        //2021-01-15
        const today = new Date();

        return today.getFullYear + '-'+ ((today.getMonth()+1)>10 ? (today.getMonth()+1) : '0' + (today.getMonth()+1)) + '-' + (today.getDate()>10 ? today.getDate() : '0' + today.getDate());
    }
    showToast(title, message, variant){
        const toast = new ShowToastEvent({
            "title": title,
            "message": message,
            "variant": variant
            

        });
        this.dispatchEvent(toast);
    }


    // constructor(){
    //     super();
    //     window.console.log('Sou o constructor');
    // }

    // connectedCallback(){
    //     window.console.log('Sou o connected callback');

    // }

    // errorCallback(error, stack){
    //     window.console.log(error);
    //     window.console.log(stack);
    // }

    
    // rende(){
    //     window.console.log("Sou o render");
    // }

    // renderedCallback(){
    //     //evitar um loop
    //     if(!this.hasLoaded){
    //         window.console.log("Sou o rendered callback");
    //         this.hasLoaded = true;

    //     }
        
    // }

    // disconnectedCallback(){
    //     window.console.log("Componente morreu");

    // }


    // handlerClick(event){
    //     //Disparar um evento
    //     const e = new CustomEvent('buttonclick', {
    //         detail:{ value: 1 , data: 2}
    //     });
    //      this.dispatchEvent(e);
    // }

    //No componente principal screenMeuComponent eu tenho que escutar o click
}