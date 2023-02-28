public class IrregularCrudOperations {

	@AuraEnabled
	public static void unresolvedMethodCallAtFieldLevel(){
		Database.insert(Builder.notARealMethod());
	}

	@AuraEnabled
	public static void unresolvedMethodCallAtObjectLevel(){
		Database.delete(Builder.notARealMethod());
	}

	@AuraEnabled
	public static void unhandledFieldAtFieldLevel(){
		List<Account> accounts = [SELECT Name, Status__c, Custom__r.Reference_Field__c from Account];
		update accounts;
	}

	@AuraEnabled
	public static void unhandledFieldAtObjectLevel(){
		Account acc = [SELECT Name, Status__c, Custom__r.Reference_Field__c from Account where Id='001abc000012345'];
		delete acc;
	}

}