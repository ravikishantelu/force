public class EditStudent1
{
    public list<StudentWrapper> wraperlist=new list<StudentWrapper>();
    public SearchAndEdit__C  updt { get; set; }
      
    public class StudentWrapper
    {
      public Id Id{get;set;}
      public String  m_sname{get;set;}
      public boolean m_EditMode{get;set;}
      public boolean m_TextMode{get;set;}
       
    }
    
     public EditStudent1()
    {
        for(SearchAndEdit__c objStud:[select Id,sname__c from SearchAndEdit__c  ])
        {
            StudentWrapper sw=new StudentWrapper();
            sw.Id=objStud.Id;
            sw.m_sname=objStud.sname__c;
            sw.m_EditMode=false;
            sw.m_TextMode=true;
            wraperlist.add(sw);
            
        }
     }
       
   
    public list<StudentWrapper> getStudent()
    {
        return wraperlist;
    }
    
    
    public void editStudent()
    {
        String sid=apexpages.currentPage().getParameters().get('empid');
        system.debug('eid::::::::::'+sid);
        for(StudentWrapper objSW:wraperlist)
        {
            system.debug('objEw.Id:::::::::'+objSW.Id);
            if(objSW.Id==sid)
            {
                objSW.m_EditMode=true;
                objSW.m_TextMode=false;
            }
            
        }
      }  
    
   /*public void update1()
   {
   
    updt=[select  sname__c from SearchAndEdit__c WHERE sname__c=: m_sname limit 1 ];
    updt.sname__c=m_sname;
    update updt;
    }*/ 
 }