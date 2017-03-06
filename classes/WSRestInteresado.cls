@RestResource(urlMapping='/interesadoycoche')
global without sharing class WSRestInteresado{
//CADA VEZ QUE ME LLEGA UN GET VA AQUI
    @HttpGet
    global static void get(){
        RestResponse res=RestContext.response;
        try{
                //todos los valores estan aqui encapsulados. Vamos a tratar la peticion
                RestRequest request = RestContext.request;
                    //headers
                   // Map <String,String> map_Headers= request.headers;
                    //parametros y los map me devuelven clave.valor
                    Map <String,String> map_Parameters= request.params;
                    //Como es un list, aunq sea null no hay pointer exception, sino q la lista esta vacia
                    
                    String idCoche=map_Parameters.get('CocheId');
                List<Interesado__c> acc=InteresadoSelector.getInteresadosByCoche(idCoche);
                
                
                String pretty =JSON.serialize(acc);
                //Añadir un valor en la cabezera diciendo q t voy a responder con un JSON y UTF-8
                res.addHeader('Content-type','application/json;charset=UTF-8');
                res.responseBody=Blob.valueof(pretty);
                //OK
                res.statusCode=200;
                
          }catch(Exception e){//solo en caso de error
              res.addHeader('Content-Type','application/json;charset=UTF-8');
              res.responseBody=Blob.valueOf('Error');
              res.statusCode=401;
          
          
          }
    }
}