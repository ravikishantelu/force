public class StudentData
{
public List<tblStudent__c> lstStud{get;set;}


public String m_StudentName{get;set;}
public String m_FatherName{get;set;}
public String m_GFatherName{get;set;}
public String m_Telephone{get;set;}
public String m_Password{get;set;}
public String m_StudStatus{get;set;}

public boolean m_iDisplay{get;set;}
public boolean m_uDisplay{get;set;}
public boolean m_dDisplay{get;set;}

public String m_SearchString{get;set;}

    public StudentData()
    {
    method2();
    }
    
    public void method2()
    {
    lstStud=[SELECT  StudentName__c,FatherName__c,GFatherName__c,Telephone__c,Password__c FROM tblStudent__c];
    }
    
    public String m_dmlOperation{get;set;}
    
    public List<SelectOption> getselected()
    {
        List<SelectOption> options=new List<SelectOption>();
        options.add(new SelectOption('INSERT','INSERT NEW RECORD'));
        options.add(new SelectOption('UPDATE','UPDATE THE RECORD'));
        options.add(new SelectOption('DELETE','DELETE A RECORD'));
        return options;
    }        
        
    
    public PageReference manipOperation()
    {
        if(m_dmlOperation.equalsIgnoreCase('INSERT'))
        {
        m_iDisplay=true;
        m_uDisplay=false;
        m_dDisplay=false;
        }
        else if(m_dmlOperation.equalsIgnoreCase('UPDATE'))
        {
        m_iDisplay=false;
        m_uDisplay=true;
        m_dDisplay=false;
        }
        else if(m_dmlOperation.equalsIgnoreCase('DELETE'))
        {
        m_iDisplay=false;
        m_uDisplay=false;
        m_dDisplay=true;
        }
        return NULL;
    }        
    
   public pageReference save()
   {
   System.Debug('***sname'+m_StudentName);
   tblStudent__c objStud=new tblStudent__c();
   objStud.StudentName__c=m_StudentName;
   objStud.FatherName__c=m_FatherName;
   objStud.GFatherName__c=m_GFatherName;
   objStud.Telephone__c=m_Telephone;
   objStud.Password__c=m_Password;
   insert objstud;
   pagereference pr=new PageReference('/apex/StudentDetailPage');
   return pr;
   }
   
   
   public pagereference searchStudentData()
   {
    System.debug('*** searchString'+m_SearchString);
    list<tblStudent__c> lststud1= [select id,StudentName__c,FatherName__c,GFatherName__c,Telephone__c,Password__c FROM tblStudent__c 
                                       where StudentName__c= :m_SearchString ];
      m_StudentName= lststud1[0].StudentName__c;                                 
      m_FatherName = lststud1[0].FatherName__c;
      m_GFatherName = lststud1[0].GFatherName__c;
      m_Telephone = lststud1[0].Telephone__c;
      m_Password=lststud1[0].Password__c;      
      return null;
   }
   public tblStudent__c  objStud { get; set; }
    public void update1()
    {
    
    objStud=[SELECT id,StudentName__c,FatherName__c,GFatherName__c,Telephone__c,Password__c FROM tblStudent__c WHERE StudentName__c=: m_SearchString limit 1 ];
    objStud.StudentName__c=m_StudentName;
    objStud.FatherName__c=m_FatherName;
    objStud.GFatherName__c=m_GFatherName;
    objStud.Telephone__c=m_Telephone;
    objStud.Password__c=m_Password;
    update objStud;
    }
    
      public void delete1()
      {
      
      objStud=[SELECT id,StudentName__c,FatherName__c,GFatherName__c,Telephone__c,Password__c FROM tblStudent__c WHERE StudentName__c=: m_SearchString limit 1 ];
      objStud.StudentName__c=m_SearchString;
      objStud.FatherName__c=m_FatherName;
      objStud.GFatherName__c=m_GFatherName;
      objStud.Telephone__c=m_Telephone;
      objStud.Password__c=m_Password;
      
      delete objStud;
      }     

    
    
   public PageReference display()
   {
      return NULL;
   }

}