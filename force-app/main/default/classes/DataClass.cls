public class DataClass {
    public DataClass(){
        system.debug('I am inside a constructor.');
    }
    
    public void method1(){
        system.debug('Inside method1.');
        List<Account> accList = [SELECT id , Name From Account ];
        system.debug('***'+accList);
        system.debug('***size'+accList.size());
    }

}