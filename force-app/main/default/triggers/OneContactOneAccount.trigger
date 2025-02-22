trigger OneContactOneAccount on Contact (before insert , before update ) {
     system.debug('trriger.new'+Trigger.new);
     system.debug('trriger.old'+Trigger.old);
    system.debug('trriger.isInsert'+Trigger.isInsert);
    system.debug('trriger.isUpdate'+Trigger.isUpdate);
    for(Contact c :Trigger.new){
         system.debug('c.AccountID'+c.AccountId);
        List<Contact> conlist = [Select Id , AccountId From Contact where AccountId =: c.AccountId];
        if(conlist.size()>0 && Trigger.isInsert){
            c.addError('There is already one contact in this account');
        }
        else if (conlist.size()==1 && Trigger.isUpdate){
           /*
             for(contact c1 : conlist){
                system.debug('c1'+c1);
                if(c.AccountId!=c1.AccountId){
                    c.addError('There is already one contact in this account');
                }
                else{
                    system.debug('this is just the update');
                }
            }
            */ 
            if(conlist[0].AccountId!=c.AccountId){
                    c.addError('There is already one contact in this account');
                }
                else{
                    system.debug('this is just the update');
                }
            
            
        }
    
    }
   

}