import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {

    message= '';
    handleClick(event){
        this.message = 'Hello From Parent';
    }
    /*
    handleClick(event){
        const customEve = new CustomEvent('sendparentmessage',{
            'message' : 'This is parent Message'
        });
        this.dispatchEvent(customEve);
    }
    */
}