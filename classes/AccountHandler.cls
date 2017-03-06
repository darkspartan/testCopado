public class AccountHandler {
    public static Account insertNewAccount(String title){
        try{
        	Account res= new Account(Name=title);
        	insert res;
        	return res;
        }catch(DMLException e){
            return null;
        }
    }

}