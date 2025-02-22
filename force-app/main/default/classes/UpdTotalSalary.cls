public class UpdTotalSalary {
    
    public void updateAccountTS (){
        List <Account> accList = [SELECT Id, Name, Total_Salary__c ,CreatedDate ,(SELECT Id ,Account__c,Salary__c,Name FROM  Employees__r)  FROM Account WHERE CreatedDate = THIS_YEAR];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                system.debug('Employee '+acc.Employees__r);
                Decimal TS = 0.000;
                for(Employee__c emp : acc.Employees__r){
                    TS = TS + emp.Salary__c;
                }
                acc.Total_Salary__c = TS ;
                system.debug('***acc.Total_Salary__c '+acc.Total_Salary__c);
            }
            update accList;
        }
    }
    
    public void updateEmpPhone (){
        List<Employee__c> empList = [SELECT id , Phone__c ,CreatedDate,Account__c ,Account__r.Phone FROM Employee__c WHERE CreatedDate = THIS_WEEK];
        if (!empList.IsEmpty()){
            for(Employee__c emp : empList){
                system.debug('***emp'+emp);
                if(emp.Account__c != null && (emp.Phone__c == null || emp.Phone__c =='')){
                    emp.Phone__c = emp.Account__r.Phone;
                }
            }
            update empList;
        }
    }

}