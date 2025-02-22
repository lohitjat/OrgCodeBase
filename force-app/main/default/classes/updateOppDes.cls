public class updateOppDes {
    
    public static void updateDesc(){
        List<Opportunity> oppList = [SELECT Id, Description, Name, StageName , createdDate  FROM Opportunity WHERE createdDate  = THIS_WEEK];
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.StageName == 'CLOSED Won'){
                    opp.Description = ' Opportunity is Closed Won';
                    
                }
                else if(opp.StageName == 'CLOSED Lost'){
                    opp.Description = 'Opportunity is Closed Lost';
                    
                }
            }
            update oppList ;
        }
    }

}