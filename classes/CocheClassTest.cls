@isTest
public class CocheClassTest {
    @isTest public static void defaultCocheClass(){
        CocheClass c= new CocheClass();
        c.updateMotor('bueno');
        c.velocidadMaximaPermitida();
        CocheClass c2= new CocheClass('bueno','bueno');
    }
    
    @isTest public static void velocidadMaxima(){
        CocheClass c= new CocheClass();
        System.assert(c.velocidadMaximaPermitida2()==120,'la velocidad maxima es incorrecta');
    }
    
    @isTest public static void checkInsert(){
        CocheClass c= new CocheClass();
        Coche__c coche=new Coche__c(name='TEST',C_V__c=23,KG__c=23);
        c.insertCoche(coche);
        List<Coche__c> coches=[select id,Color__c from Coche__c where name='TEST'];
        System.assert(coches.size()>0);
    }
    
    @isTest public static void checkBadInsert(){
        CocheClass c= new CocheClass();
        Coche__c coche=new Coche__c(name='TEST');
        try{
            c.insertCoche(coche);
        }catch(DMLException e){
            System.assert(e.getMessage().contains('Debes indicar el peso y la potencia del coche'));
        }
        
        List<Coche__c> coches=[select id,Color__c from Coche__c where name='TEST'];
        System.assert(coches.size()==0);
    }
    
    @isTest public static void checkUpdate(){
        CocheClass c= new CocheClass();
        Coche__c coche=new Coche__c(name='TEST',C_V__c=23,KG__c=23,Color__c='Blanco');
        c.insertCoche(coche);
        coche=[select id,Color__c from Coche__c where name='TEST'];
        c.updateCoche(coche.Id);
        coche=[select id,Color__c from Coche__c where name='TEST'];
       	System.debug('Coche'+coche);
        System.assert(coche.Color__c=='Negro');
    }
    
    @isTest public static void checkBadUpdate(){
        CocheClass c= new CocheClass();
        try{
            c.updateCoche(null);
        }
        catch(QueryException e){
            System.assert(e.getMessage().contains('List has no rows for assignment to SObject'));
        }
    }
    
    @isTest public static void checkDelete(){
        CocheClass c= new CocheClass();
        Coche__c coche=new Coche__c(name='TEST',C_V__c=23,KG__c=23);
        c.insertCoche(coche);
        c.deleteCoche(coche.Id);
        List<Coche__c> coches=[select id,Color__c from Coche__c where name='TEST'];
        System.assert(coches.size()==0); 
    }
    
    @isTest public static void checkBadDelete(){
        CocheClass c= new CocheClass();
        try{
            c.deleteCoche(null);
        }
        catch(QueryException e){
            System.assert(e.getMessage().contains('List has no rows for assignment to SObject'));
        }
    }
    
    @isTest public static void checkConstructor(){
        
    }
    @isTest public static void checkGetCochesRapidos(){
       	CocheClass c= new CocheClass();
        for(Coche__c coche:c.getCochesRapidos()){
            System.assert(coche.Velocidad_maxima__c>CocheClass.MAXIMA,'Coche demasiado lento');
        }
    }
     @isTest public static void checkGetCochesBlancos(){
       	CocheClass c= new CocheClass();
        for(Coche__c coche:c.getCochesBlancos()){
            System.assert(coche.Color__c=='Blanco','Coche de color');
        }
    }

}