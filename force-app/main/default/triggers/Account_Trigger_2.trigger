trigger Account_Trigger_2 on Account (before insert) {
    for (Account a:Trigger.New){
        if(Trigger.isInsert && a.AnnualRevenue<1000000){
            a.addError('Insert Error');
        }
        else if(Trigger.isUpdate && a.AnnualRevenue<500000){
            a.addError('Update Error');
        }
    }
}