public class QueueableClassUpdateAcc implements Queueable {
    
    private List<Account> accList ;
    private Id parentId ;
    
    public QueueableClassUpdateAcc(List<Account> accListPara , Id parentIdPara) {
        this.accList = accListPara;
        this.parentId = parentIdPara;
    }
    
    public void execute (QueueableContext context){
        for(Account acc :accList){
            acc.ParentId = parentId;
        }
        
        if (accList.size()>0){
            update accList;
        }
    }
    
}
/* 
 Use the below code to run queueable job
List <Account> accList = [SELECT id,ParentId From ACCOUNT limit 5];
Id parentId = '0012y000007KcUt';
QueueableClassUpdateAcc q = new QueueableClassUpdateAcc(accList,parentId);
System.enqueueJob(q);
*/