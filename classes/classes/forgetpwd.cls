public class forgetpwd
{
  public string emailid{set;get;}
  public string newpwd{set;get;}
  public long no{set;get;}
  PageReference pg;
  public string color{set;get;} 
  public forgetpwd(){
      color='white';
  } 
  public PageReference forget()
 {
    Registeration__c forg=new Registeration__c();
    pg=new PageReference ('/apex/Forget_Password');
    pg.setRedirect(false);
    try{forg=[Select Unique_Name__c, Mobile_no__c,Password1__c from Registeration__c where Unique_Name__c=:emailid ];}catch(Exception e){
        color='red';
        
      
    }
    if(forg.Unique_Name__c==emailid && forg.Mobile_no__c==no)
    {
      
      forg.Password1__c=newpwd;
       update forg;
      pg=new PageReference ('/apex/Front_Page_SC');
       pg.setRedirect(True);
       
   }
   else
   {
       color='red';
      
      
   }
   return pg;
   }
}