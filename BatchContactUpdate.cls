public class BatchContactUpdate implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){        
        String query = 'SELECT Account.Name, Account.Description,Title, Description FROM Contact where Account.name !=null';
        return Database.getQueryLocator(query);}    
    public void execute(Database.BatchableContext bc, List<Contact> contacts){
        List<Account> oAcc= [Select Id,name,Description from Account where name !=null] ;
        for(Account acc:oAcc)
        {
		  if (contacts != null)  
          {            
            for(Contact con : contacts) {      
                if(acc.Id==con.AccountId){
                con.Description= con.Title+' '+'of ' +acc.name +' '+': '+ con.Account.Description ;
                }
            }
            update contacts;
          }
        }
    }
    
    public void finish(Database.BatchableContext bc)
    {
		// Sending success or failure emails to admins        
    }
}