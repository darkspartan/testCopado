public class customControllerClase {
    
    
    public Boolean step1{get;set;}
    public Contact contact{get;set;}
    public Interesado__c newInteresado{get;set;}
    public boolean showTable{get;set;}
    public List<Interesado__c> interesados{get;set;}
    
   
    
    public customControllerClase(ApexPages.StandardController ctrl){
        step1=true;
        contact=(Contact) ctrl.getRecord();
        showTable=false;
        newInteresado= new Interesado__c(Contact__c=contact.Id);
    }
    
    public void Guardar(){
        update this.contact;
        step1=false;
    }
    public void Guardar2(){
        insert newInteresado;
        this.interesados= [select coche__r.name,coche__r.color__c from Interesado__c where Contact__c = :this.contact.Id];
        showTable=true;
        
    }
}