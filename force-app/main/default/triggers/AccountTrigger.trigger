trigger AccountTrigger on Account (before insert,after insert ,before update , after update ,before delete , after delete , after undelete) {
    if(Trigger.IsInsert){
        if(Trigger.IsBefore){
            system.debug('Do Nothing');
        }
        else if(Trigger.IsAfter){
            AccountTriggerHandler.createRelatedRecord(Trigger.New);
            //AccountTriggerHandler.createRelatedContact(Trigger.New);
        }
    }
    
    if(Trigger.IsUpdate){
        if(Trigger.IsBefore){
            system.debug('Do Nothing');
        }
        else if(Trigger.IsAfter){
            AccountTriggerHandler.updatePhoneOnContact(Trigger.New , Trigger.OldMap);
        }
    }
    
    if(Trigger.IsDelete){
        if(Trigger.IsBefore){
            AccountTriggerHandler.stopDeletion(Trigger.Old);
        }
        else if(Trigger.IsAfter){
            system.debug('Do Nothing');
        }
    }
    
    if(Trigger.IsUndelete && trigger.IsAfter){
        AccountTriggerHandler.undeleteAccount(Trigger.New);
    }

}