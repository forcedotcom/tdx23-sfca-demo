public Class InvocationPointsTrial {

	@AuraEnabled
	public static string createInformation(String firstName, String lastName, String phone){
        String[] fieldsToCheck = new String[] {'FirstName', 'LastName'};
        for (String fieldToCheck : fieldsToCheck) {
            verifyCreateable('Contact', fieldToCheck);
        }

        Contact c = new Contact();
        c.FirstName = firstName;
        c.LastName = lastName;
        c.Phone = phone;

        insert c;

        return c.Id;
	}

    @RemoteAction
	public static string createInformation2(String firstName, String lastName, String phone){
        String[] fieldsToCheck = new String[] {'FirstName', 'LastName'};
        for (String fieldToCheck : fieldsToCheck) {
            verifyCreateable('Contact', fieldToCheck);
        }

        Contact c = new Contact();
        c.FirstName = firstName;
        c.LastName = lastName;
        c.Phone = phone;

        insert c;

        return c.Id;
	}

	void verifyCreateable(String objectName, String fieldName) {
		if (!UTIL_Permissions.getInstance().canCreate(objectName, fieldName)) {
			throw new Exception('No create access');
		}
	}

}