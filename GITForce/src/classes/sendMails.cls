global with sharing class sendMails implements Database.Batchable<Contact>{
   
   global Iterable<Contact> start(Database.BatchableContext BC) {
        Contact[] q = [SELECT Id FROM Contact];
        return q;
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> scope) {
        List<Messaging.SingleEmailMessage> allMails = new List<Messaging.SingleEmailMessage>();        
        for(Contact c : scope) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'ravi@tvarana.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Job is done');
        mail.setPlainTextBody('The Apex job processed');
        allMails.add(mail);
       }
       Messaging.sendEmail(allMails);
    }
    
    global void finish(Database.BatchableContext BC) {
       System.debug('.......................JOB IS DONE');
    }
    
}