public class product_SC
{
    public string id{set;get;}
    public string name{set;get;}
    public string company{set;get;}
    public integer price{set;get;}
    public string discription{set;get;}
    String param_value;
    public string value{set;get;}
    public integer quantity{set;get;}
    public blob file{get;set;}
    
    
    PageReference newpage;
    Product__c pobj=new Product__c();
    public String getParam_value() {
       param_value = system.CurrentPageReference().GetParameters().get('value');
        return param_value;
    }
    public String setParam_value() {
         return null;
    }
    
    public PageReference cancel_f(){
        newpage=new PageReference('/apex/Admin_SC?att='+'Anshuman');
        newpage.setRedirect(true);
        return newpage;
    }
    
    public PageReference done_f(){
    value=param_value;
    
           
    
    
    try{
        if(param_value=='INSERT')
        {
            pobj.name=name;
            pobj.PID__C=id;
            pobj.Company__c=company;
            pobj.PPrice__c=price;
            pobj.PDiscription__c=discription;
            pobj.Quantity__c=quantity;
            pobj.Sell_out__c=0;
           
            insert pobj;
        }
        else if(param_value=='DELETE')
        {
            pobj=[select PID__c from Product__c where PID__c=:id];
            
            delete pobj;
        }
        else if(param_value=='MODIFIE'){
            pobj=[select PID__c from Product__c where PID__c=:id];
            pobj.name=name;
            pobj.PID__C=id;
            pobj.Company__c=company;
            pobj.PPrice__c=price;
            pobj.PDiscription__c=discription;
            pobj.Quantity__c=quantity;
            
            update pobj;
            
        }}catch(Exception e)
        {
            value='Failed to '+param_value;
        }
        
        
        newpage=new PageReference('/apex/Product_SC?value='+value);
        newpage.setRedirect(true);
        return newpage;
    }
    
    
     
    
}