trigger Case_1 on Case (before insert ,before update ) {
    List<Case> lstcase = new List<Case> ();
    system.debug('Trigger.new---'+Trigger.new);
    system.debug('Trigger.old---'+Trigger.old);
    for(Case c : Trigger.new){
        if(c.Origin=='Email'){
            c.Priority = 'Low';
            lstcase.add(c);
        }
    }
    if(lstcase.size()>0){
       // update lstcase;
    }

}