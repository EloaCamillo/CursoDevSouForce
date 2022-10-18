import { LightningElement, track, wire } from 'lwc';
import{loadScript} from 'lightning/platformResourceLoader';
import pubsubLib from '@salesforce/resourceUrl/PubSub'
import {CurrentPageReference} from 'lightning/navigation'

export default class MostrarPubSub extends LightningElement {

    @wire (CurrentPageReference) pageRef;
    @track variant;

    connectedCallback(){
     loadScript(this, pubsubLib).then(()=>{
         window.console.log('Pub-Sub carregado com sucesso');
         //Escutar(preciso passar o nome do evento que quero escutar,método que vou disparar e a propria classe) 
         window.pubsub.registerListener('selectedVariant', this.handlerPubSub, this)
     }).catch(error =>{
         window.console.log(error);
     })
    }

    handlerPubSub(event){
        this.variant = event.detail.variant;
    }

    disconnectedCallback(){
        //Encarregado de fazer a limpeza de todas as escutas.
        window.pubsub.unregisterAllListeners(this);

    }
}