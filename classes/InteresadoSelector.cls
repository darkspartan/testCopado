public class InteresadoSelector{
    public static List<Interesado__c> getInteresadosByCoche(Id idCoche){
        List<Interesado__c> inter= [select id,name from Interesado__c where Coche__c= :idCoche];
        return inter;
    }
}