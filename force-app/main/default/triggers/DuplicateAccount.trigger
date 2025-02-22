trigger DuplicateAccount on Account (before insert) {
    //system.debug('*****'+Trigger);
    system.debug('*****'+Trigger.New);
    List<Account> accList = Trigger.New;
    for(Account acc : accList){
        system.debug('***'+acc.Name);
    }
    List<Account> accListExist = [SELECT ID , Name from Account ];
    Set<String> nameAcc = new Set <String> ();
    for(Account acc :accListExist){
        nameAcc.add(acc.Name);
    }
    
    system.debug('***nameAcc '+nameAcc);
    for(Account acc : accList){
        if(nameAcc.contains(acc.Name)){
            acc.addError('An Account with this name already exists!');
        }
    }

}