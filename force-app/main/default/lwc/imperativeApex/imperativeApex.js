import { LightningElement, track } from 'lwc';
import getAccount from '@salesforce/apex/AccountControllerAC.getAccount'

export default class ImperativeApex extends LightningElement {
    accounts;

    handleClick(event){
        getAccount()
        .then(result=>{
            console.log(result);
            this.accounts = result;
        })
        .catch(error =>{
            console.log(error);
        });

    }

    handleResetClick(event){
        this.accounts = null;
    }

    


}