import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    isVisible = false;
    handleChange(event){
        this.isVisible = event.target.checked;
    }
}