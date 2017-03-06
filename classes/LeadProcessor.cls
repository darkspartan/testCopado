global class LeadProcessor implements Database.Batchable<sObject>{
    
	global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID,LeadSource FROM Lead ');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leads=new List<Lead>();
        leads.addAll(scope);
        for (Lead lead : leads) {
            lead.LeadSource='Dreamforce';
        }
        update leads;
    }    

    global void finish(Database.BatchableContext bc){
        
    }    



}