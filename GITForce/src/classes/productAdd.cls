public class productAdd
{        
    public productAdd()
    {
    }
    
    public PageReference AddQuantity()
    {   
        PageReference pageRef= new PageReference('/apex/AddQuantity');
        pageRef.setredirect(true);        
        return pageRef;           
    }
    
    
    public PageReference SubQuantity()
    {   
        PageReference pageRef= new PageReference('/apex/DemoPassing2');
        pageRef.setredirect(true);        
        return pageRef;           
    }
           
           
      public PageReference Back()
    {   
        PageReference pageRef= new PageReference('/apex/DemoPassing1');
        pageRef.setredirect(true);        
        return pageRef;           
    }       
           
}