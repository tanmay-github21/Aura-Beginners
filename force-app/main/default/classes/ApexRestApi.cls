public with sharing class ApexRestApi {
    public static HttpResponse GetDetails() 
    {
        Http http= new Http(); 
        HttpRequest request= new HttpRequest(); 
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response= http.send(request); 
        if(response.getStatusCode() == 200)
        {
            Map<String,Object> results= (Map<String,Object>)JSON.deserializeUntyped(response.getBody()); 
            List<Object> animals=(List<object>)results.get('animals'); 
            for(Object animal : animals)
            System.debug('Got The Following Animal From End Point'+'\t'+animal); 
        }
        else {System.debug('Error Occured While Retreiving Data From EndPoint'+'\t'+response.getStatus());}
        return response; 
    }

    public static HttpResponse PostDetails()
    {
        Http http= new Http();
        HttpRequest request= new HttpRequest(); 
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8'); 
        Request.setBody('{"name":"Salesforce"}; {"name":"tanmay"}'); 
        HttpResponse response= http.send(request); 
        if(response.getStatusCode()!=201)
        {
            System.debug('Error Posting Data To End Point'+'\t'+response.getStatusCode()+'\n'+response.getStatus());
        }
        else {System.debug('Successfully Posted Data To EndPoint'+'\t'+response.getBody());}
        return response; 
    }
}
