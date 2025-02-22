import { LightningElement } from 'lwc';

export default class C3_Comp1 extends LightningElement {

    greeting = 'Lohit';

    
    handleClick(event){
       // this.greeting = this.template.querySelector("lightning-input").value;
        var input = this.template.querySelectorAll("lightning-input");
        
    }
}