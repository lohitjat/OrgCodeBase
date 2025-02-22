public class updatePhoneNumber {
    
    public  void updateAccount(){
        List<Account> accList = [SELECT Id, Name ,Phone ,CreatedDate FROM ACCOUNT WHERE CreatedDate = THIS_WEEK];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Phone = '1111111111';
            }
            update accList;
        }
        
    }
    
}