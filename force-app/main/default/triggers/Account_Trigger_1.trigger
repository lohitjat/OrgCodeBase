trigger Account_Trigger_1 on Account (before Insert,before Update) {
for(Account a:Trigger.New){
    system.debug('a----'+a);
    if(a.AnnualRevenue<1000000){
    a.addError('Annual Revenue should not be less than 1 million');
    }
 }
}