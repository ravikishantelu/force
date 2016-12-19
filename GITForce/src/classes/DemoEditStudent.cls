public class DemoEditStudent
{
    public list<StudentWrapper> wraperlist=new list<StudentWrapper>();
    
     public class StudentWrapper
    {
        public Id Id{get;set;}
        public String  m_StudentName{get;set;}
        public Date m_DOB{get;set;}
        public boolean m_EditMode{get;set;}
        public boolean m_TextMode{get;set;}
    }
    
     public DemoEditStudent()
    {
          
       for(DemoEditStudent__c objDemoEditStudent:[select Id,StudentName__c,DOB__c
           from  DemoEditStudent__c ])
        {
            StudentWrapper sw=new StudentWrapper();
            
            sw.Id=objDemoEditStudent.Id;
            sw.m_StudentName=objDemoEditStudent.StudentName__c;
            sw.m_DOB=objDemoEditStudent.DOB__c;
           //sw.studCheck=false;
            sw.m_EditMode=false;
            sw.m_TextMode=true;
           wraperlist.add(sw);
        }
      
    }
       
   public list<StudentWrapper> getStudent()
    {
        return wraperlist;
    }
   /* public void editStudent()
    {
        String sid=apexpages.currentPage().getParameters().get('empid');
        system.debug('eid::::::::::'+sid);
        for(StudentWrapper objSW:wraperlist)
        {
            system.debug('objEw.StudId:::::::::'+objSW.Id);
            if(objSW.Id==sid)
            {
                objSW.m_EditMode=true;
                objSW.m_TextMode=false;
            }
            
        }
        
    }*/
}