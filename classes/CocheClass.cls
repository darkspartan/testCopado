public class CocheClass implements InterfaceCoche{
    private String modelo{get;set;}
    private String motor{get;set;}
    public static Integer MAXIMA=120;
    
    
    public void updateMotor(String motor){
        this.motor=motor;
    }
    
    public CocheClass(){
        this.modelo='Test';
        this.motor='Test';
    }
    public CocheClass(String modelo, String motor){
        this.modelo=modelo;
        this.motor=motor;
    }
    
    public void velocidadMaximaPermitida(){
        System.debug(MAXIMA);
    }
    
    public Integer velocidadMaximaPermitida2(){
        System.debug(MAXIMA);
        return MAXIMA;
    }
    
    public List<Coche__c> getCochesRapidos(){
        return [Select NAme from Coche__C where Velocidad_maxima__c > :MAXIMA];
    }
    
    public List<Coche__c> getCochesBlancos(){
        List<Coche__c> coches= [FIND 'clio' IN ALL FIELDS RETURNING Coche__c ][0];
        return coches;
    }
    
    public void insertCoche(Coche__c coche){
        try{
            insert coche;
        }catch(Exception e){
            System.debug(e);
        }
        
    }
    
    public void updateCoche(Id cocheId){
        Coche__c coche= [Select name from Coche__c where Id = :cocheId];
        coche.Color__c='Negro';
        update coche;
    }
    public void deleteCoche(Id cocheId){
        Coche__c coche= [Select name from Coche__c where Id = :cocheId];
        delete coche;
    }

}