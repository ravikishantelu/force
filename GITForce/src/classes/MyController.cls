public class MyController
{
public Field_Container__c fieldContainer {get; set;}

public void MyController()
{
   fieldContainer=new Field_Container__c();
}

public void DoSomethingWithDates()
{
    Date d1=fieldContainer.Date_1__c;
    Date d2=fieldContainer.Date_2__c;

    // do stuff.
}
}