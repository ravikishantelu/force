public class SendVFAsAttachment{

    public static void sendVF(String EmailIdCSV, String Subject,String body,String userSessionId)
    {
        //Replace below URL with your Salesforce instance host
        String addr = 'https://ap1.salesforce.com/services/apexrest/sendExcelPDFEmail';
        HttpRequest req = new HttpRequest();
        req.setEndpoint( addr );
        req.setMethod('POST');
        req.setHeader('Authorization', 'OAuth ' + userSessionId);
        req.setHeader('Content-Type','application/json');

        Map<String,String> postBody = new Map<String,String>();
        postBody.put('EmailIdCSV',EmailIdCSV);
        postBody.put('Subject',Subject);
        postBody.put('body',body);
        String reqBody = JSON.serialize(postBody);

        req.setBody(reqBody);
        Http http = new Http();
        HttpResponse response = http.send(req);
    }
}