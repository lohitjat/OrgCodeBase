public class C1_MyContactList {
    @AuraEnabled
    public static List <Contact> getContacts(Id recordId){
        return [select FirstName, LastName, Email, Phone from Contact Where AccountID =:recordId];
    }
}