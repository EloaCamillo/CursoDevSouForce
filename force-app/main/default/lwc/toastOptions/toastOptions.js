import { LightningElement, api, wire } from 'lwc';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';
import{loadScript} from 'lightning/platformResourceLoader';
import pubsubLib from '@salesforce/resourceUrl/PubSub'
import {CurrentPageReference} from 'lightning/navigation'

export default class ToastOptions extends LightningElement {

    variants = [
        {label: 'Info', value: 'info'},
        {label: 'Success', value: 'success'},
        {label: 'Warning', value: 'warning'},
        {label: 'Error', value: 'error'}     
    ]

    // modes = [
    //     {label: 'Dimissable', value: 'dimissable'},
    //     {label: 'Pester', value: 'pester'},
    //     {label: 'Sticky', value: 'sticky'},
    // ]

    variant = 'info';
   @api mode ;
   @api buttonLabel;
   @wire (CurrentPageReference) pageRef;

   connectedCallback(){
    loadScript(this, pubsubLib).then(()=>{
        window.console.log('Pub-Sub carregado com sucesso');
    }).catch(error =>{
        window.console.log(error);
    })
   }

    handlerVariantChange(event){
        this.variant = event.detail.value;
        // Setar o que foi recebido
        //no firevent passo a página que estou e o nome do evento que quero dispara
        window.pubsub.fireEvent(this.pageRef, 'selectedVariant', {
            detail:{
                variant : this.variant
            }
           

        });
    }

    disconnectedCallback(){
        //Encarregado de fazer a limpeza de todas as escutas.
        window.pubsub.unregisterAllListeners(this);

    }
    handlerModeChanged(event){
        this.mode = event.detail.value;
    }

    handlerToastEvent(event){
        const toast = new ShowToastEvent({
            "title": "Titulo do Toast",
            "message": "Mensagem",
            "variant": this.variant,
            "mode": this.mode

        });
        this.dispatchEvent(toast);
    }

}