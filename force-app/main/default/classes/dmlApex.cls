public class dmlApex {
    
    public void insertRecords (){
        Account acc = new Account (Name ='Testacc1');
       // system.debug('***accBefore '+acc);
        insert acc;
        system.debug('***accAfter '+acc);
    }

}