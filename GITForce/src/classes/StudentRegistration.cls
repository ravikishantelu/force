public Class StudentRegistration
{

  public String  m_StudID{get;set;}
  public String  m_studentName{get;set;}
  public tblStudent__c m_Password{get;set;}
  public String m_FatherName{get;set;}
  public String m_GFatherName{get;set;}
  public boolean m_StudStatus{get;set;}
  public tblStudent__c m_DOB{get;set;}
  public tblStudent__c m_Telephone{get;set;}
  public tblStudent__c  m_HouseNo{get;set;}
  public String  m_State{get;set;}
  public String  m_City{get;set;}
  public String  m_Nationality{get;set;}
  public String  m_Gender{get;set;}
    
    
  public StudentRegistration()
  {
  m_Telephone=new tblStudent__c();
  m_HouseNo= new tblStudent__c(); 
  m_DOB=new tblStudent__c(); 
  m_Password= new tblStudent__c(); 
  }
  
  public void InsertNewRecord()
  {
      tblStudent__c objStud =new tblStudent__c();

      //objStud.StudID__c=m_StudID;     
      objStud.StudentName__c=m_StudentName;
      //objStud.Password__c=m_Password;
      String t=m_Password.Password__c;
      objStud.FatherName__c=m_FatherName;
      objStud.GFatherName__c=m_GFatherName;
      objStud.StudStatus__c=m_StudStatus;
      Date d1=m_DOB.DOB__c;
      //objStud.Telephone__c=m_Telephone;
      String hn=m_HouseNo.HouseNo__c;
      //objStud.HouseNo__c =m_HouseNo;
      String i=String.valueOf(m_Telephone.Telephone__c);
      objStud.Nationality__c=m_Nationality;
      objStud.State__c=m_State;
      objStud.City__c=m_City;
      objStud.Gender__c=m_Gender;
            
      try
      {
      insert objStud;
      }
      catch(Exception exc)
      {
      System.debug('###'+exc);
      ApexPages.Message myMsg =new ApexPages.Message(ApexPages.Severity.info,'Registration Success');
      }
   
  }
  

}