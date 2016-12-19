public class DemoSearchStudent
{
public List<DemoEditStudent__C>  lstStud { get; set; }

public DemoEditStudent__C  objStud { get; set; }


public string m_StudentName{get;set;}
public Date m_DOB{get;set;}
public string searchString{get;set;}
//public string id{get; set;}

    public PageReference search()
     {
     lststud= [SELECT  StudentName__c,DOB__c FROM DemoEditStudent__c]; // + 'WHERE m_StudentName LIKE  \'%'+searchString+'%\' ORDER BY StudentName__c  ';
     m_StudentName   =lststud[0].StudentName__c;
     m_DOB=  lststud[0].DOB__c;
     return null; 
    }
}