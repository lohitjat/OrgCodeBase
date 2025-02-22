@isTest
public class UpdTotalSalaryTest {
    @isTest
    private static void method1(){
        Account acc1 = new Account(Name = 'Test1' , Total_Salary__c = 0);
        insert acc1;
        system.debug('***acc1 '+acc1);
        Employee__c emp1 = new Employee__c();
        emp1.Salary__c = 200.00;
        emp1.Account__c = acc1.Id;
        insert emp1;
        UpdTotalSalary u = new UpdTotalSalary ();
        Test.startTest();
        u.updateAccountTS(); 
        Test.stopTest();
        system.debug('***acc1 '+acc1);
        Account acc2 = [SELECT id , Total_Salary__c FROM Account where id =: acc1.id LIMIT 1 ];
        system.debug('***acc2 '+acc2);
        System.assertEquals(emp1.Salary__c,acc2.Total_Salary__c);
    }

}