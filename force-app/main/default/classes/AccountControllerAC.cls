public class AccountControllerAC {
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccount(){
        List<Account> accList = new List<Account>();
        accList = [SELECT id,Name,Industry From Account Limit 10];
        return accList;
    }

}