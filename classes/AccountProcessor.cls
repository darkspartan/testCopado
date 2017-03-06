public class AccountProcessor {
  @future
  public static void countContacts(List<Id> recordIds) {
    //List<Account> accounts = [Select Id, Name from Account Where Id IN :recordIds];
      //System.debug(accounts);
      //for(Account account: accounts){
        //Id accountId=account.Id;
      for (Id accountId: recordIds){
          Account account = [Select Id, Name from Account Where Id = :accountId];
          List<Contact> contacts = new List<Contact>([SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :accountId]);
          account.Number_of_Contacts__c=contacts.size();
              system.debug(contacts);
        	update account;
      }
		//List<Contact> contacts = new List<Contact>([SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :recordIds]);
        
    //}
  }
}