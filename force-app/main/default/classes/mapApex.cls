public class mapApex {
    public void mapBasic(){
        List<Account> accList = new List<Account>();
        //accList = [SELECT Name,Phone,Id  From Account LIMIT 3];
        Map<Id, Account> idAccountMap = new Map<Id, Account>([SELECT Name,Phone,Id  From Account LIMIT 3]);
        system.debug('idAccountMap-----'+idAccountMap);
        
    }
    
}