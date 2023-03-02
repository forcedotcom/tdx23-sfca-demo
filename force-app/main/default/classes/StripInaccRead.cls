public class StripInaccRead {
	@AuraEnabled
	public static string readData(){
		List<Account> unsanitizedAcc = [SELECT Id, Name from Account];
		SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, unsanitizedAcc);
		List<Account> sanitizedAcc = securityDecision.getRecords();
		System.debug(sanitizedAcc);
	}
}