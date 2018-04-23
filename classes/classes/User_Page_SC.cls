public class User_Page_SC{
    public string value{set;get;}
    public string val{set;get;}
    public string pid{set;get;}
    
    
    public Registeration__c regobj{set;get;}
    public list<Product__c> pobj;
    
    
    public User_Page_SC(){
    pid='';
    val=ApexPages.currentPage().getParameters().get('att');
    try{
        regobj=[select Name from Registeration__c where Unique_Name__C=:val];
        value=regobj.name;
        }catch(Exception e){}
        
    }
    public list<Product__c> getpro(){
        pobj=[select PID__c,name,PPrice__c,PDiscription__c,PImage__c from Product__c];
        return pobj;
    }
    
    
    
    public PageReference updateProfile_f(){
        PageReference newpage= new PageReference('/apex/Update_Profile_SC?value='+val);
        newpage.setRedirect(true);
        return newpage;
    }
    public PageReference buyproduct_f(){
        System.debug(pid);
        PageReference newpage1= new PageReference('/apex/Product_View_SC?value='+pid+'&att='+val);
        newpage1.setRedirect(true);
        return newpage1;
    }
    public PageReference goback_f(){
        PageReference newpage=new PageReference('/apex/User_Page_SC?att='+val);
        newpage.setRedirect(true);
        return newpage;
    }
    
}