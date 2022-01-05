trigger AssignPermissionSet1 on User (before insert,before update, before delete,after insert, after update,after delete) {
if(Trigger.isAfter && Trigger.isInsert)
    {
    Set<ID> userIds = new Set<Id>();
    Profile usr = [Select Id, Name From Profile Where Name='Custom: Marketing Profile'];
        for(User user:Trigger.new)
        {
            if(user.ProfileId==usr.Id)
            {
                userIds.add(user.Id);
            }
        }        
       AssignPermissionSet.AssignPermissionSetToUsers(userIds);
    }

}