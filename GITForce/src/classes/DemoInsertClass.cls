public class DemoInsertClass 
{
public List<DemoInsert__c>  lstStud { get; set; }
public List<selectOption> DemoDepartmentOptions{get;set;}
public DemoInsert__c  objDemo { get; set; }


public string m_DemoName{get;set;}
public string m_DemoPassword{get;set;}
public DemoInsert__c m_DemoDepartment{get;set;}


      public DemoInsertClass()
      {
      m_DemoDepartment=new DemoInsert__c();
      lstStud=new list<DemoInsert__c>();
      lstStud=[SELECT DemoDepartment__c from DemoInsert__c ORDER BY DemoDepartment__c];
      DemoDepartmentOptions=new List<selectOption>();
      }
      
      public List<selectOption> getDemoDepartmentNames()
      {
      for(DemoInsert__c objDepartment : lstStud)
      {
      DemoDepartmentOptions.add(new selectOption(objDepartment.DemoDepartment__c, objDepartment.DemoDepartment__c));
      }
      return DemoDepartmentOptions;
      }
      
       
      public void insert1()
      { 
      if( objDemo == null)
      objDemo = new DemoInsert__c();
      objDemo.DemoName__c=m_DemoName;
      objDemo.DemoPassword__c=m_DemoPassword;
      String s1=m_DemoDepartment.DemoDepartment__c; 
 
     insert objDemo;
   
  }
  
  /* public PageReference search() {
     lststud= [select  Name,sno__c,address__c from Stu__c WHERE Name=: Name limit 1 ];
     Name   =lststud[0].Name;
     sno=  String.valueOf(lststud[0].sno__c);
     address=   String.valueOf( lststud[0].address__c);
   
    return null; 
    }
   public void update1(){
    
    objStud=[select  Name,sno__c,address__c from Stu__c WHERE Name=: Name limit 1 ];
    objStud.name=name;
    objStud.sno__c=sno;
    objStud.address__c=address;
    
    update objStud;
    }
  
    public void delete1(){
      objStud=[select  Name,sno__c,address__c from Stu__c WHERE Name=: Name limit 1 ];
      objStud.name=name;
      objStud.sno__c=sno;
      objStud.address__c=address;
    
    delete objStud;
    }     
    
     public void upsert1(){
      objStud=[select  Name,sno__c,address__c,id__c from Stu__c WHERE Name=: Name limit 1 ];
      objStud.name=name;
      objStud.sno__c=sno;
      objStud.address__c=address;
     
    Stu__c stu = new Stu__c(name=objStud.name,sno=objStud.sno__c,address=objStud.address__c,id=objStud.id__c);
    // objStud.add(stu);
     upsert stu; 
     upsert objStud;
     }
     */
     

  }