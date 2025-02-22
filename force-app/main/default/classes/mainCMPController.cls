public class mainCMPController {
    
    @AuraEnabled(Cacheable = true)
    public static list<Account> getAccountData(String textkey) {
        textkey = '%' + textkey + '%';
        list<Account> accLst = [SELECT  Id, Name From Account WHERE Name LIKE :textkey LIMIT 5];
        
        if(accLst.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return accLst; 
    }

    @AuraEnabled(Cacheable = false)
    public static List<Contact> getRelatedContact(Id accountId){
        List<Contact> conList = [SELECT Id, LastName,Email, AccountId, FirstName FROM Contact where AccountId =: accountId ORDER BY LastName];
        return conList;
       
    }

    @AuraEnabled(Cacheable = false)
    public static boolean updateContact(List<Contact> contactList, Id accountId){
        List<Contact> conListDataBase = [SELECT Id, LastName,Email, AccountId, FirstName FROM Contact where AccountId =: accountId];
        Set<Id> contactIdsDatabase = new Set<Id>(); 
        for(Contact condata : conListDataBase){
            contactIdsDatabase.add(condata.Id);
        }
        List<Contact> conToUpdate = new List<Contact>(); 
        system.debug('****contactList'+contactList);
        for(Contact con : contactList){
            con.AccountId = accountId;
            contactIdsDatabase.remove(con.id);
        }
        try{
            upsert contactList;
            List<Contact> conToDelete = [SELECT Id, LastName,Email, AccountId, FirstName FROM Contact where Id IN :contactIdsDatabase];
            delete conToDelete;
            return true;
        }
        catch(DmlException e){
            System.debug('The following exception has occurred: ' + e.getMessage());
            String errorMsg = e.getMessage();
            throw new AuraHandledException(errorMsg);

        }
        
        
    }

    
}