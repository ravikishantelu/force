//Generated by wsdl2apex

public class AsyncHelloworldWSDL {
    public class helloworldResponse_elementFuture extends System.WebServiceCalloutFuture {
        public void getValue() {
            System.WebServiceCallout.endInvoke(this);
        }
    }
    public class AsyncHelloWorldController {
        public String endpoint_x = 'https://ap1.salesforce.com/services/Soap/class/HelloWorldController';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public HelloworldWSDL.SessionHeader_element SessionHeader;
        public HelloworldWSDL.DebuggingHeader_element DebuggingHeader;
        public HelloworldWSDL.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public HelloworldWSDL.CallOptions_element CallOptions;
        public HelloworldWSDL.DebuggingInfo_element DebuggingInfo;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/HelloWorldController';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/HelloWorldController';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/HelloWorldController';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/HelloWorldController';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/HelloWorldController';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/HelloWorldController', 'HelloworldWSDL'};
        public AsyncHelloworldWSDL.helloworldResponse_elementFuture beginHelloworld(System.Continuation continuation) {
            HelloworldWSDL.helloworld_element request_x = new HelloworldWSDL.helloworld_element();
            return (AsyncHelloworldWSDL.helloworldResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncHelloworldWSDL.helloworldResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/HelloWorldController',
              'helloworld',
              'http://soap.sforce.com/schemas/class/HelloWorldController',
              'helloworldResponse',
              'HelloworldWSDL.helloworldResponse_element'}
            );
        }
    }
}