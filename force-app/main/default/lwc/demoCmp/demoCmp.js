import { LightningElement ,wire ,api } from 'lwc';
import getContacts from '@salesforce/apex/demoCmpController.getContacts'

export default class DemoCmp extends LightningElement {
    @api recordId;

    @wire(getContacts, {accId :'$recordId'})
    contacts;
}