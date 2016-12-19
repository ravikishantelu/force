public abstract class OAuthRestController {
    
    static String clientId = '3MVG9Y6d_Btp4xp7FIY7Ss9SfgRCLDYiG23Op59IENODDaDwVO.37kSSlMpQOAEDe1MkMVpzOUFJDG5WeQ8Dv'; // Set this in step 3
    static String clientSecret = '3976019490807002676'; // Set this in step 3
    static String redirectUri = 'https://c.ap1.visual.force.com/apex/RestCall'; // YOUR PAGE URL IN THE SOURCE ORG
    String loginUrl = 'https://mysales-dev-ed.my.salesforce.com' ; // YOUR MY DOMAIN URL IN THE TARGET ORG
    static String cookieName = 'oauth';
    
    public PageReference login() {
        // Get a URL for the page without any query params
        String url = ApexPages.currentPage().getUrl().split('\\?')[0];
       
        System.debug('url is '+url);

        String oauth = (ApexPages.currentPage().getCookies().get(cookieName) != null ) ?
            ApexPages.currentPage().getCookies().get(cookieName).getValue() : null;
        if (oauth != null) {
            // TODO - Check for expired token
        }
       
        System.debug('oauth='+oauth);
        if (oauth != null) {
            // All done
            return null;
        }
       
        // If we get here we have no token
        PageReference pageRef;
        System.debug('*****************');
        if (! ApexPages.currentPage().getParameters().containsKey('code')) {
            // Initial step of OAuth - redirect to OAuth service
            System.debug('*****************');
       
            String authuri = loginUrl+'/services/oauth2/authorize?'+
                'response_type=code&client_id='+clientId+'&redirect_uri='+redirectUri;
                           
            pageRef = new PageReference(authuri);
        } else {
            // Second step of OAuth - get token from OAuth service
            String code = ApexPages.currentPage().getParameters().get('code');

            System.debug('OAuth Step 2 - code:'+code);
               
            String body = 'grant_type=authorization_code&client_id='+clientId+
                '&redirect_uri='+redirectUri+'&client_secret='+clientSecret+
                '&code='+code;
            System.debug('body is:'+body);
               
            HttpRequest req = new HttpRequest();
            req.setEndpoint(loginUrl+'/services/oauth2/token');
            req.setHeader('Authorization', 'OAuth '+UserInfo.getSessionId());
            req.setMethod('POST');
            req.setBody(body);
       
            Http h = new Http();
            HttpResponse res = h.send(req);
   
            String resp = res.getBody();
            System.debug('FINAL RESP IS:'+EncodingUtil.urlDecode(resp, 'UTF-8'));
           
            ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(cookieName,
                res.getBody(), null,-1,false)});
               
            // Come back to this page without the code param
            // This makes things simpler later if you end up doing DML here to
            // save the token somewhere
            pageRef = new PageReference(url);
            pageRef.setRedirect(true);
        }
       
        return pageRef;
    }
   
    public static String getRestTest() {
    
        String oauth = (ApexPages.currentPage().getCookies().get(cookieName) != null ) ?
            ApexPages.currentPage().getCookies().get(cookieName).getValue() : null;
        
        System.debug('**************'+oauth);
        JSONObject oauthObj = new JSONObject( new JSONObject.JSONTokener(oauth));

        String accessToken = oauthObj.getValue('access_token').str,
               instanceUrl = oauthObj.getValue('instance_url').str;
        System.debug('**************'+accessToken);
        System.debug('**************'+instanceUrl);       

        HttpRequest req = new HttpRequest();
 
        req.setMethod('GET');
        req.setHeader('Authorization', 'OAuth '+accessToken);
        req.setEndpoint(instanceUrl+'/services/apexrest/TestRest?name=Kishan');
        

        Http http = new Http();
 
        HTTPResponse res = http.send(req);

        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        System.debug('STATUS_CODE:'+res.getStatusCode());
       
        return res.getBody();
        return null;
    }
    
}