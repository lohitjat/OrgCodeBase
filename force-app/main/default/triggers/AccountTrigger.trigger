trigger AccountTrigger on Account (before insert,before update) {
    for(Account acc : Trigger.New){
        system.debug('@@@acc'+acc);
        if(acc.Rating == 'Hot'){
            acc.Sic ='Updated From Tigger';
        }
    }

}