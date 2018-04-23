public class Admin_SC{
    
    PageReference logout;
    public string search{set;get;}
    public Product__c pobj{set;get;}    
    String param_value;
    public list<Product__c> getpro(){
        list<Product__c> pob;
        pob=[select name,PPrice__c,Company__c,PID__c,PImage__c,Sell_out__c from Product__c order by Sell_out__c DESC];
        return pob;
    }
    public list<Product__c> getpro1(){
        list<Product__c> pob;
        pob=[select name,PPrice__c,Company__c,PID__c,PImage__c,Quantity__c from Product__c order by Quantity__c];
        return pob;
    }
    public String getParam_value() {
       param_value = system.CurrentPageReference().GetParameters().get('att');
        return param_value;
    }
    
    public String setParam_value() {
         return null;
    }
    public void search_f(){
    try{
        pobj=[select name,PPrice__c,PDiscription__c,Company__c from Product__c where PID__c=:search];}catch(Exception e){ search='NO RESULT FOUND';}
        
        
    }
    public PageReference logout_f()
    {
        logout=new PageReference('/apex/Front_Page_SC');
        logout.setRedirect(true);
        return logout;
    }
    public PageReference insert_f()
    {
        logout=new PageReference('/apex/Product_SC?value='+'INSERT');
        logout.setRedirect(true);
        return logout;
    }
    public PageReference delete_f()
    {
        logout=new PageReference('/apex/Product_SC?value='+'DELETE');
        logout.setRedirect(true);
        return logout;
    }
    public PageReference modified_f()
    {
        logout=new PageReference('/apex/Product_SC?value='+'MODIFIE');
        logout.setRedirect(true);
        return logout;
    }
    
 
}