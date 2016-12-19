public class EditStudent
{
    public list<StudentWrapper> wraperlist=new list<StudentWrapper>();
    
    public class StudentWrapper
    {
    
    
     // public List<tblStudent__c> lstStud{get;set;}
     // public tblStudent__c objStu{get;set;} 
      public Id Id{get;set;}
      public String  m_StudentName{get;set;}
      public String m_FatherName{get;set;}
      public String m_GFatherName{get;set;}
      public Date m_DOB{get;set;}
      public String  m_HouseNo{get;set;}
      public String  m_State{get;set;}
      public String  m_City{get;set;}
      public String  m_Nationality{get;set;}
      public String m_Gender{get;set;}
      public boolean m_StudStatus{get;set;}
      public String m_Telephone{get;set;}
       
        public boolean m_EditMode{get;set;}
        public boolean m_TextMode{get;set;}
        
       
    }
    
     public EditStudent()
    {
    
        
         for(tblStudent__c objStud:[select Id,StudentName__c,FatherName__c,GFatherName__c,
                    DOB__c,Gender__c,HouseNo__c ,State__c,StudStatus__c,
                    City__c,Nationality__c,Telephone__c from  tblStudent__c  ])
        {
            StudentWrapper sw=new StudentWrapper();
            sw.Id=objStud.Id;
            sw.m_StudentName=objStud.StudentName__c;
            sw.m_FatherName=objStud.FatherName__c;
            sw.m_GFatherName=objStud.GFatherName__c;
            sw.m_HouseNo=objStud.HouseNo__c;
            sw.m_Telephone=objStud.Telephone__c;
            sw.m_State=objStud.State__c;
            sw.m_City=objStud.City__c;
            sw.m_Nationality=objStud.Nationality__c;
            sw.m_StudStatus=false;
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
    
   /* 
    public void update1()
    {
    for(tblStudent__c objStu :[SELECT Id,StudentName__c,FatherName__c,GFatherName__c,
                    DOB__c,Gender__c,HouseNo__c ,State__c,StudStatus__c,
                    City__c,Nationality__c,Telephone__c from  tblStudent__c ]);
         {
         StudentWrapper sw=new StudentWrapper();
                                
    sw.Id=objStu.Id;                
    sw.m_StudentName=objStu.StudentName__c;                
    sw.m_FatherName=objStu.FatherName__c;
    sw.m_GFatherName=objStu.GFatherName__c;
    /*objStu.DOB__c=m_DOB;
    objStu.Gender__c=m_Gender;
    objStu.HouseNo__c=m_HouseNo;
    objStu.Nationality__c=m_Nationality;
    objStu.State__c=m_State;
    objStu.City__c=m_City;
    objStu.StudStatus=m_StudStatus;
    objStu.Telephone=m_Telephone;
    
    wraperlist.add(sw);
    }
  }
 */
 }