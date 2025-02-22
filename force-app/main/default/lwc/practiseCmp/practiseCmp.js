import { LightningElement,wire,api,track } from 'lwc';

export default class PractiseCmp extends LightningElement {
    @track temp = false;
    @track array=[];
    handleclick(event){
        if(this.temp==false){
            this.temp = true;
        }
        else{
            this.temp =false;
        }
        var arrSize= this.array.length;
        this.array.push(arrSize++);
        console.log(this.array);
    }

}