//this class is made to test out the REST endpoint which is hosted on the Heroku server. The sample code is given
//in the trailhead module. We Are using a static resource to mock the response received from salesforce. 
@isTest
private class AnimalsCalloutsTest
{
    @isTest static void testGetCallout()
    {
        StaticResourceCalloutMock mock= new StaticResourceCalloutMock(); 
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json; charset=UTF-8'); 
        //Callout to be associated with mock response
        Test.setMock(HttpCalloutMock.class, mock); 
        HttpResponse result=ApexRestApi.GetDetails();
        //Check if the response is null or not 
        System.assertNotEquals(null,result,'The callout returned a null object'); 
        System.assertEquals(200,result.getStatusCode(),'Status Code Are Different'+'\t'+result.getStatusCode());
        System.assertEquals('application/json; charset=UTF-8',result.getHeader('Content-Type'),
        'Content-Type do not match'+'\t'+result.getHeader('Content-Type'));
        System.debug('Content Type'+'\t'+result.getHeader('Content-Type'));
        //If everything is ok check that the returned list size is3
        Map<String,Object>results= (Map<String,Object>)json.deserializeUntyped(result.getBody());
        List<object> animals= (List<object>)results.get('animals');
        System.assertEquals(3,animals.size(),'Returned object size do not match'+'\t'+animals.size()); 
    }
        
}

