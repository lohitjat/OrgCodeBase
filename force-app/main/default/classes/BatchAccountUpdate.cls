public class BatchAccountUpdate implements Database.batchable<sObject> , Database.stateful {
    
    public Integer totalAccount = 0;
    
    public Database.QueryLocator start (Database.batchableContext bc){
        return Database.getQueryLocator([SELECT id ,Name , Phone FROM ACCOUNT]);
        
    }
    
    public void execute (Database.batchableContext bc , List <Account> accList){
        for(Account acc :accList){
            acc.Phone ='7388793671'; 
        }
        totalAccount = totalAccount +accList.size() ;
        if(accList.size()>0){ 
            update accList;
        }
    }
    
    public void finish (Database.batchableContext bc){
        System.debug(totalAccount +'Account get updated ');
        
    }

}