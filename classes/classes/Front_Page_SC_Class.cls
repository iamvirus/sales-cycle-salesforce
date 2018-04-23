public class Front_Page_SC_Class{
    
    
    public string name1{set;get;}
    public string UN{set;get;}
    public string pass{set;get;}
    public long mobile{set;get;}
    
    public string address{set;get;}
    public string email{set;get;}
    public string loginUN{set;get;}
    public string loginPASS{set;get;}
    public boolean msg{set;get;}
    public boolean loginfail{set;get;}
    public string gender=null;
    public string url{set;get;}
    
    Registeration__c regobj=new Registeration__c();
    PageReference newpage;
    
    public PageReference create(){
    newpage=new PageReference('/apex/Front_Page_SC');
    try{
        regobj.Name=name1;
        regobj.Unique_name__c=UN;
        regobj.EmailID__c=email;
        regobj.Address__c=address;
        
        regobj.Mobile_no__c=mobile;
        regobj.Password1__c=pass;
        regobj.Gender__c=gender;
        insert regobj;
        msg=true;
        
        newpage.setRedirect(true);
        
    }catch(Exception e){newpage.setRedirect(false);}
    
    return newpage;
        
    }
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Male','MALE')); 
        options.add(new SelectOption('Female','FEMALE')); 
         return options; 
    }
    
    public String getgender() {
        return gender;
    }
    public void setgender(String gender) { this.gender = gender; }

    public PageReference check()
    {
            
        
            try{regobj=[select name,Unique_name__c,Password1__c from Registeration__c where Unique_name__c=:loginUN];
            }catch(Exception e){
            newpage=new PageReference('/apex/Front_Page_SC');
            newpage.setRedirect(false);
            loginfail=false;
            }
            
            url=regobj.name;
            if(regobj.Unique_name__c==loginUN && regobj.Password1__c==loginpass)
            {
                if(regobj.Unique_name__c=='sunny')
                {
                    newpage=new PageReference('/apex/Admin_SC?att='+url);
                    newpage.setRedirect(true);
                }
                else
                {
                    newpage=new PageReference('/apex/User_Page_SC?att='+regobj.Unique_name__c);
                    newpage.setRedirect(true);
                }
            
            }
            else
            {
            loginfail=false;
            newpage=new PageReference('/apex/Front_Page_SC');
            newpage.setRedirect(false);
            }

            return newpage;
  
    }
     Pagereference pg1;
 Registeration__c acc=new Registeration__c();
 public PageReference s3()
 {
    pg1=new PageReference ('/apex/Forget_Password');
    pg1.setRedirect (true);
    return pg1;
  
   }
    }