public class accountController {
 List<client__c> clie = [select Name from client__c];
    List<contact__c> cont = [select Name from contact__c];
 List<Project__c> proj = [select Name from Project__c];
    
    public List<client__c> getclie(){
        return clie;
    }
    
    public List<contact__c> getcont(){
        return cont;
    }
    
    public List<project__c> getproj(){
        return proj;
    }
}