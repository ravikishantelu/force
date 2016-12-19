public with sharing class LoginToOrg {

    public String m_UserName { get; set; }

    public String m_Password { get; set; }
    
    public void login() {
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://ap1.salesforce.com/services/Soap/u/29.0');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'text/xml;charset=UTF-8');
        req.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' + m_UserName+ '</username><password>' + m_Password+ '</password></login></Body></Envelope>');
        System.debug('******'+req);
        Dom.XmlNode resultElmt = (new Http()).send(req).getBodyDocument().getRootElement()
          .getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/')
          .getChildElement('loginResponse', 'urn:partner.soap.sforce.com')
          .getChildElement('result', 'urn:partner.soap.sforce.com');
        
        final String SERVER_URL = resultElmt.getChildElement('serverUrl', 'urn:partner.soap.sforce.com') .getText().split('/services')[0];
        final String SESSION_ID = resultElmt.getChildElement('sessionId', 'urn:partner.soap.sforce.com') .getText();

    }

}