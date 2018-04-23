public class Update_Profile_SC{
    public string value;
    public string name1{set;get;}
    public string UN{set;get;}
    public string pass{set;get;}
    public long mobile{set;get;}
    public boolean msg{set;get;}
    public string address{set;get;}
    public string email{set;get;}
    public string getvalue(){
    value=system.CurrentPageReference().GetParameters().get('value');
    return value;
    }
    public void setvalue(String value){this.value=value;
        
    }
    
    Registeration__c regobj=new Registeration__c();
    PageReference newpage;
    public PageReference updateProfile_f(){
    newpage= new PageReference('/apex/User_Page_SC?att='+value);
    try{
        regobj=[select name from Registeration__c where Unique_Name__c=:value];
        regobj.Name=name1;
        
        regobj.EmailID__c=email;
        regobj.Address__c=address;
        
        regobj.Mobile_no__c=mobile;
        regobj.Password1__c=pass;
        msg=true;
    
        newpage.setRedirect(true);
        
        update regobj;
        
        
        }catch(Exception e){msg=false;
        newpage.setRedirect(false);}
        
        
        return newpage;
    }
    
    

}