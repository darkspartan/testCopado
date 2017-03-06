global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id
            FROM Lead];
        for (Lead lead : leads) {
            lead.LeadSource='Dreamforce';
        }
        update leads;
    }

}