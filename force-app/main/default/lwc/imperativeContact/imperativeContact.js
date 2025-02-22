import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts'

export default class ImperativeContact extends LightningElement {
    
    /*
    connectedCallback(){
        getContacts()
        .then(result =>{
            console.log(result);
            this.contacts = result;
            console.log(result);
        })
        .catch(error =>{
            console.log(error);
        })
    }
        */
    @wire(getContacts)
    contacts;
    
}