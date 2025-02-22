trigger Engagement_Trigger_1 on Engagement__c (before insert) {
    for(Engagement__c e : Trigger.new){
        e.status__c=e.Project__r.status__c;
         }
}