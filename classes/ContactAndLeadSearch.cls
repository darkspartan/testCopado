public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String str){
        return [FIND :str IN NAME FIELDS RETURNING Contact(lastname), Lead(name)];
    }

}