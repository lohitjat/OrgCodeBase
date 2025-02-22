import { LightningElement, track } from 'lwc';
import getAccountData from '@salesforce/apex/mainCMPController.getAccountData';
import getRelatedContact from '@salesforce/apex/mainCMPController.getRelatedContact'; 
import updateContact from '@salesforce/apex/mainCMPController.updateContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const columns = [
    
    { label: 'Last Name', fieldName: 'LastName', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'First Name', fieldName: 'FirstName', type: 'text' },
    {   label: 'Action',
        type: 'button',
        typeAttributes: { 
            label: 'View Details', 
            name: 'view_details', 
            title: 'Click to View Details' 
        }
    },
    { label: 'Cancel', type: 'button',  typeAttributes: { label: 'Cancel', name: 'cancel', title: 'Click to cancel' } }
];
export default class mainCMP extends LightningElement {
    @track isLoading = false;
    @track searchTerm = '';
    @track accounts;
    @track contacts;
    @track data;
    columns = columns;
    @track selectedAccountId;
    isModalOpen = false;
    selectedRow;
  
    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
        getAccountData({ textkey: this.searchTerm })
        .then(result => {
            this.accounts = result;
        })
        .catch(error => {
            // Handle errors
        });
    }

    handleAccountClick(event) {
        const accountId = event.currentTarget.dataset.id;
        const accountName = event.currentTarget.dataset.name;
        this.selectedAccountId = accountId;
        this.searchTerm = accountName;
        this.accounts = null;

        getRelatedContact({accountId : this.selectedAccountId})
        .then(data => {
            this.contacts = data;
         })
        .catch(error => {
            // Handle errors
        });
        
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'cancel') {
            // Open the modal and set the selected row
            this.contacts = this.contacts.filter(contact => contact.Id !== row.Id);
        }
        if (actionName === 'view_details') {
            // Open the modal and set the selected row
            this.selectedRow = row;
            this.isModalOpen = true;
        }
    }
    handleInputChange(event){
        const fieldName = event.target.label;
        const value = event.target.value;
        this.selectedRow = { ...this.selectedRow, [fieldName]: value };
    }
    addContact(){
        const newId = String(Date.now());
        let tempID= this.contacts.length.toString(); 
        // Add a new row to the data array
        this.contacts = [...this.contacts, { LastName: ' ', Id: tempID}];
   
        
    }
    saveChanges(){
        // Save changes and close the modal
        // In a real-world scenario, you would typically make a server call (e.g., Apex method) to persist the changes
        // For demonstration, we will update the data on the client-side
        const updatedData = [...this.contacts];
        const index = updatedData.findIndex(item => item.Id === this.selectedRow.Id);
        
        if (index !== -1) {
            updatedData[index] = { ...this.selectedRow };
        }

        this.contacts = updatedData;
        this.isModalOpen = false;
    }
    closeModal() {
        // Close the modal
        this.isModalOpen = false;
    }

    handleSuccess() {
        // Show a success toast message
        const event = new ShowToastEvent({
            title: 'Success',
            message: 'Record saved successfully',
            variant: 'success',
        });
        this.dispatchEvent(event);
    }
    
    handleError(a,b,c) {
        // Show a success toast message
        const event = new ShowToastEvent({
            title: a,
            message: b,
            variant: c,
        });
        this.dispatchEvent(event);
    }

    Submit(){
        this.contacts.forEach(contact => {
            console.log('Contact LastName:', contact.LastName);
            if(contact.Id.length<10){
                contact.Id = null;
            }
            // Perform any other operations with the contact data
        });

        this.isLoading = true;
       
        updateContact({contactList :this.contacts , accountId : this.selectedAccountId})
        .then(data => {
            if(data == true ){
                this.handleSuccess();
                console.log('Data save to database');
            }
         })
        .catch(error => {
            // Handle errors
            console.log('Data not save to database');
            this.handleError("Error", error.body.message, "error");
        })
        .finally(() => {
            // Set isLoading to false to hide the loader
            this.isLoading = false;
        });

        console.log('***Method executed');
    }
}