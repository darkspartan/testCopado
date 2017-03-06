@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                billingstate='NY'
            ));
        }
        for (Integer i = 0; i < 100; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                billingstate='CA'
            ));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        List<Account> accounts = [select id, name from account];
        Contact contact = new Contact(LastName='TEST');
        AddPrimaryContact createContact = new AddPrimaryContact(contact, 'CA');
        
        Test.startTest();        
        System.enqueueJob(createContact);
        Test.stopTest();        
      
    }


}