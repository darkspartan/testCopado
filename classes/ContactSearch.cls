public class ContactSearch {
    public static List<Contact> searchForContacts(string name,string postalCode){
        return [SELECT Id,Name FROM Contact WHERE LastName = :name AND MailingPostalCode = :postalCode];
    }

}