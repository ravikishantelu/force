public class tblUser {

     public PageReference clear() {
    PageReference clearpage=new PageReference('/apex/tblUser');
        return clearpage;
    }



    public PageReference register() {
        return null;
    }

PageReference newPage;

    public PageReference tblUser() {
    
    newPage = Page.tblStudent;
    return newPage.setRedirect(true);

    
        return null;
    }


    public String m_Password { get; set; }

    public String m_Username { get; set; }
   
    public tblUser()
    
    {
    
    }
    public void login()

    {
    list<tblUser__c> lstuser = new list<tblUser__c>();
      lstuser =[select  Password__c  from tblUser__c];
      
      if((lstuser.size())== 1)
      {
         ApexPages.Message myMsg =new ApexPages.Message(ApexPages.Severity.info,'Login Success');

                  ApexPages.addMessage(myMsg);
          newPage = Page.tblStudent;

          
      }
      
}
}