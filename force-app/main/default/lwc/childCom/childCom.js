import { LightningElement, api } from 'lwc';

export default class ChildCom extends LightningElement {
    message='';
    handleChange(event){
        this.message = event.target.value;
    }

    handleClick(event){
        const custEvent = new CustomEvent('sendmessage',{
            detail : this.message
        });
        this.dispatchEvent(custEvent);
    }
}
