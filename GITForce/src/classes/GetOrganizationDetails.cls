@RestResource(urlMapping='/organization/*')

global class GetOrganizationDetails {
    
    @HttpPost
    global static void doPost() {
    
        RestRequest req = RestContext.request;
        
        system.debug('========='+req.requestBody.toString());
        String reqBody = req.requestBody.toString();
        System.debug('fromJSONfromJSON'+FromBossAccToSFAcc.parse(reqBody).result);
        //Organization__c objOrg = NEW Organization__c();
        //objOrg.Name = 
    }
    
    @HttpGet
    global Static String doGet() {
        
        return 'Success';
    }
}