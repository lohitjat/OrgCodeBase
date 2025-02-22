public with sharing class demoCmpController {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts(Id accId){
        try {
            List<Contact> conList = [Select id , AccountId , Lastname , FirstName , Name
                                        From Contact where AccountId =:accId  ];
            
            return conList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}