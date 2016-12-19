global class DuplicateLead {
    
    Public Attachment myfile;
    String email;
    String LastName;
    String Company;
    global void param() {
        Map<String, String> l = ApexPages.currentPage().getParameters();
        System.debug('1111111111111'+l);
        email = ApexPages.currentPage().getParameters().get('email');
        LastName = ApexPages.currentPage().getParameters().get('Last_Name');
        System.debug('*********'+LastName);
        Company = ApexPages.currentPage().getParameters().get('Company');
        System.debug('*************'+email);
        List<Lead> le = [SELECT Id, Email, Count__c FROM LEAD WHERE Email =: email];
        if(le.size() > 0) {
            List<Lead> leadLst = new List<Lead>();
            for(Lead leadsToUpdate : le) {
                /*Lead l1 = [SELECT Id, Email, Count__c FROM LEAD WHERE Email =: email];
                if(l1.Count__c == null) {
                    l1.Count__c = 0;
                }
                l1.Count__c = l1.Count__c + 1;
                update l1 ;
                */
                if(leadsToUpdate.Count__c == null) {
                    System.debug('-----------------------');
                    leadsToUpdate.Count__c = 0;
                }
                leadsToUpdate.Count__c = leadsToUpdate.Count__c + 1;
                System.debug('*******************************'+leadsToUpdate.Count__c);
                leadLst.add(leadsToUpdate);
            }
            update leadLst;            
        }
        else { 
            Lead l2 = new Lead();
            l2.LastName = LastName;
            l2.Email = email;
            l2.Company = Company;
            insert l2;
        }
    }
}