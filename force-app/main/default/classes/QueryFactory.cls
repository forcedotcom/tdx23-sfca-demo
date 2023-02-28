public class QueryFactory {
	public QueryFactory setLimit(Integer recordLimit) {
		return this;
	}

	public String toSoql() {
		return 'SELECT Name, TypeName from MyType__c';
	}
}