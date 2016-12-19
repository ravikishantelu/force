public with sharing class Tab1Extension {
  
    //reference to the current account
    private Account acct;
    private Task edit_task1=null;
    
    public Task getStart()
    {        
        return edit_task1;
    }  
    public Tab1Extension(ApexPages.StandardController stdController) 
    {
        this.acct= (Account)stdController.getRecord();
 
        edit_task1= new Task();
        edit_task1.OwnerId = UserInfo.getUserId(); 
        edit_task1.Priority = 'Normal';
        
    }
 
}