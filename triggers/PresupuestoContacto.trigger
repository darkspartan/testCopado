trigger PresupuestoContacto on Contact ( before update) {
    for (Contact contact : Trigger.new){
        if(contact.Presupuesto__c <= 10000){
            contact.addError('Presupuesto debe ser mayor de 10000');
        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Presupuesto debe ser mayor de 10000'));
        }
            
    }
    

}