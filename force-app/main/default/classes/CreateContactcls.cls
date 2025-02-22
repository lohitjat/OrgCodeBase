public class CreateContactcls {
    @Auraenabled
    public static string createContact(Contact contObj){
        system.debug('contact::'+contObj.FirstName);
        insert contObj;
        return contObj.id;
    }
    
	@Auraenabled
    public static List<Contact> retrieveContacts(){
        return [select id,FirstName,LastName from Contact limit 3];
    }
}