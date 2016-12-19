public class DemoReportCard 
    {
    public list<DemoReportCard__c> lstcard{get;set;}
    public String m_Gsection { get; set; }
    public string m_StudentName{get;set;}
    public string m_FatherName{get;set;}
    public string m_Telugu{get;set;}
    public string m_Hindi{get;set;}
    public string m_English{get;set;}
    public string m_Total{get;set;}
    public string searchString{get;set;}
    //public string grade{get;set;}
    
    public pageReference search() 
    {
    lstcard=[SELECT StudentName__c,Gsection__c,FatherName__c,Telugu__c,Hindi__c,English__c,Total__c from DemoReportCard__c WHERE Gsection__c =: m_Gsection ];
    //lstcard= 'SELECT  StudentName__c,Gsection__c,Total__c FROM DemoReportCard__c' + 'WHERE m_StudentName LIKE  \'%'+searchString+'%\' ORDER BY StudentName__c  ';

     //System.debug('***'+lstcard + '***'+ m_Gsection ); 
    return null;
    }
    /*
    public List<SelectOption> getGsections()
    {
    List<SelectOption> options=new List<SelectOption>();
    List<DemoReportCard__c> Gsectionlist=new List<DemoReportCard__c>();
    Gsectionlist=[SELECT Gsection__c from DemoReportCard__c];
    options.add(new selectOption('--None--','--None--'));
    
    for(Integer j=0;j<Gsectionlist.size();j++)
    {
      options.add(new SelectOption(Gsectionlist[j].Gsection__c ,Gsectionlist[j].Gsection__c ));
    }   
    return options;
    }*/
    }