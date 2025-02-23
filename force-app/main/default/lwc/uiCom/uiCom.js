import {LightningElement, wire,track } from 'lwc';
import getAccount from '@salesforce/apex/AccountControllerAC.getAccount'

export default class UiCom extends LightningElement {

    @track accounts;

    connectedCallback(){
        getAccount()
        .then(results =>{
            this.accounts = results;
        })
        .catch(error =>{
            console.log('There is a error');
        })
    }

    /*@wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data; // Assign retrieved accounts
        } else if (error) {
            console.error('Error fetching accounts', error);
        }
    }
        */
    /*
    @wire(getAccount)
    adsh({data,error}){
        if(data){
            this.accounts = data;
        }
        else if(error){
            //console.log('There is a error');
        }
    }
    */

    columns = [
        { label: 'Account Name', fieldName: 'Name', type: 'text' },
        { label: 'Industry', fieldName: 'Industry', type: 'text' }
    ];
    /*get accountsData() {
        return this.accounts?.data;
    }*/
}