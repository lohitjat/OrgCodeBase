import { LightningElement } from 'lwc';

export default class C3_Comp1 extends LightningElement {

    greeting = 'Lohit';

    /*handleChange(event){
        this.greeting = event.target.value;
    }*/

    handleClick(event){
        this.greeting = this.template.querySelector("lightning-input").value;
    }
}