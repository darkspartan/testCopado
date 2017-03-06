public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact=new Contact(LastName='TEST');
        this.state=state;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts= [select id,billingstate from account];
        for(Account account: accounts){
            if(account.billingstate==this.state){
                contact.Account=account;
                 upsert  contact;
            }
        }
    }
}