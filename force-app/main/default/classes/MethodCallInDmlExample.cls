public Class MethodCallInDmlExample {
	@AuraEnabled
	public static string readInformation(){
        List<MyType__c> myData = readData();
	}

	void verifyReadable(String objectName, String fieldName) {
		if (!UTIL_Permissions.getInstance().canRead(objectName, fieldName)) {
			throw new Exception('No create access');
		}
	}

    List<MyType__c> readData() {
        return (List<MyType__c>)Database.query(
            newQueryFactory()
            .setLimit(10)
            .toSOQL()
        );
        // throw new Exception();
    }

    QueryFactory newQueryFactory() {
        return new QueryFactory();
    }

}