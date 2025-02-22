trigger ExampleTrigger on Contact (after insert,after delete) {
    if(Trigger.isInsert){
        Integer readcount = Trigger.New.size();
        EmailManager.sendMail('lohitjat1313@gmail.com','Trailhead Trigger Tutorial', readcount+' contact(s) were inserted.');
    }
    else if (Trigger.isDelete){
        
    }

}