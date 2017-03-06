trigger crearcontacto on Coche__c (after insert) {
    for (Coche__c coche : Trigger.new) {
        // Iterate over each sObject
        Contact cont= new Contact(firstname='Daniel',lastname='Utrera',description=coche.Marca__c+' '+coche.name+' '+coche.C_V__c+' '+coche.KG__c);
        insert cont;
    }
    

}