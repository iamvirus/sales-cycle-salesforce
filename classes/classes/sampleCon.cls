public class sampleCon {
        String[] countries = new String[]{};
            
        public PageReference test() {
            PageReference newpage=new PageReference('/apex/Front_Page_SC');
            newpage.setRedirect(true);
            return newpage;
            
        }
            
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('INDIA','India'));
            options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));
            return options;
        }
        
        public List<Student__c> gets1(){
            List<Student__c> s1;
            s1=[select Name,EmailID__c from Student__c];
            return s1;
        
        }
        
        public string n{set; get;}
        public string x{set; get;}
        Student__c stobj = new Student__c();
        public void s1()
        {
        stobj.Name=n;
        stobj.EmailID__c=x;
        insert stobj;
        }
        
        public Student__c stu{set;get;}
        public sampleCon()
        {
         stu=[select name,EmailID__c from Student__c where name='ravi'];
        }
            
        public String[] getCountries() {
            return countries;
        }
            
        public void setCountries(String[] countries) {
            this.countries = countries;
        }
    }