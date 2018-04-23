public class Product_View_SC{
    
    public Product__c pobj{set;get;}
    public string param_value{set;get;}
    public string uname{set;get;}
    public boolean msg{set;get;}
    public Product_View_SC(){
        msg=false;
       param_value = system.CurrentPageReference().GetParameters().get('value');
       uname = system.CurrentPageReference().GetParameters().get('att');
        try{
        pobj=[select Sell_out__c,name,PImage__c,PPrice__c,PDiscription__c,PID__c,Quantity__c from Product__c where PID__C=:param_value];}catch(Exception e){param_value='hhhh';}
    }
    public void buy_f()
    {    
        msg=true;
        pobj.Quantity__c=pobj.Quantity__c-1;
        pobj.Sell_out__c=pobj.Sell_out__c+1;
        update pobj;
    }
    public PageReference goback_f(){
        PageReference newpage=new PageReference('/apex/User_Page_SC?att='+uname);
        newpage.setRedirect(true);
        return newpage;
    }
    
}