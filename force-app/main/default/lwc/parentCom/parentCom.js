import { LightningElement } from 'lwc';

export default class ParentCom extends LightningElement {
    parentText='Parent Value'
    handleEvent(event){
       this.parentText =  event.detail;
    }
    onfileupload(event){
        console.log('Change occur in file input ');
    }
}
