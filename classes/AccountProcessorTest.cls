@isTest
public class AccountProcessorTest {
  @IsTest
  private static void test() {
    Test.startTest();
      Account a= new Account(Name='Company');
      insert a;
      Contact c=new Contact(LastName='TEST',Account=a);
      insert c;
      List<Id> ids=new List<Id>();
      ids.add(a.Id);
      AccountProcessor.countContacts(ids);
    Test.stopTest();
  }


}