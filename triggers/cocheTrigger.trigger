trigger cocheTrigger on Coche__c (before insert, before update) {
    System.debug('Modificando registros de coches. PELIGRO');

}