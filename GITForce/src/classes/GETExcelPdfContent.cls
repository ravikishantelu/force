@RestResource(urlMapping='/sendExcelPDFEmail/*')
Global class GETExcelPdfContent{
     @HttpPost
    global static void sendEmail(String EmailIdCSV, String Subject, String body) {
        
        System.debug('EmailIdCSVEmailIdCSV'+EmailIdCSV);
    /*
    List<String> EmailIds = EmailIdCSV.split(',');

        //PageReference ref = Page.PDF_DEMO;
        PageReference ref = new PageReference('/apex/Excel_Report?id='+reportId);
        PageReference ref2 = new PageReference('/apex/PDF_Report?id='+reportId);
        Blob b = ref.getContent();
        Blob b2 = ref2.getContentAsPdf();
        System.debug('***************'+b);
        System.debug('***************'+b2);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        Messaging.EmailFileAttachment efa1 = new Messaging.EmailFileAttachment();
        efa1.setFileName('ExcelReport.xls');
        efa1.setBody(b);
        
        Messaging.EmailFileAttachment efa2 = new Messaging.EmailFileAttachment();
        efa2.setFileName('PDFReport.pdf');
        efa2.setBody(b2);
        
        String addresses;
        email.setSubject( Subject +String.valueOf(DateTime.now()));
        email.setToAddresses( EmailIds  );
        email.setPlainTextBody(Body);
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa1, efa2});
        //Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    */
    }
}