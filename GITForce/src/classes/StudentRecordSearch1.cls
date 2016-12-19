public class StudentRecordSearch1 
{
public List<Stu__C>  lstStud { get; set; }

public Stu__C  objStud { get; set; }


public string Name{get;set;}
public string sno{get;set;}
public string address{get;set;}
public string id{get; set;}

    public PageReference search() {
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
    
  /*  public void upsert1(){
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
     
    public void insert1(){ 
   if( objStud == null)
      objStud = new Stu__c();
      objStud.name=name;
      objStud.sno__c=sno;
      objStud.address__c=address; 
 
     insert objStud;
    
    
}
}