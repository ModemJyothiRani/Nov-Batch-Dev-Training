public class AssignPermissionSet {
@future 
  public static void AssignPermissionSetToUsers (Set<Id> userIds) {     
      PermissionSet permset=[Select Id,Name From PermissionSet Where Name='Marketing_User_Permissions'];
	List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
	for (User u : [Select Id, Name FROM User Where Id IN : userIds]){ 
		PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = permset.Id, AssigneeId = u.Id);
		permissionSetList.add(psa);
	}
	insert permissionSetList;
  }
}