public class NoCrudFlsIssueRepro {
	private static final Set<SObjectField> FIELDS = new Set<SObjectField>{
        Custom_Obj__c.Field_1__c,
        Custom_Obj__c.Field_2__c
    };

    @AuraEnabled
    public static void insertCustomObj(String logString,String status){
        if(logString != null && logString != ''){ 
            List<Custom_Obj__c> ieList = new List<Custom_Obj__c>();
            if( AccessCheckUtility.isCreatable(Schema.sObjectType.Custom_Obj__c, FIELDS)){//access checked here
                    for(InvoiceImporterLogWrapper logWrapper:logList){
                        Custom_Obj__c ie = new Custom_Obj__c ();
                        ie.Field_1__c = 'somevalue.log';
                        ie.Field_2__c = 'somevalue.log';
                        ieList.add(ie);
                    }
            }
            //Access checked above
            database.insert(ieList,false);//FLS violation here, despite access being checked above via utility class
        }    
    }


//AccessCheckUtility
class AccessCheckUtility {
    public static Boolean isCreatable(DescribeSObjectResult sObjectDescribe, Set<SObjectField> sObjectFieldSet) {
        if (sObjectDescribe == null || ! sObjectDescribe.isCreateable()) {
            String accessCreateableError = 'Some Error';
            throw new AuraHandledException(accessCreateableError + sObjectDescribe.name + '.');
        }

        for (SObjectField sObjectField : sObjectFieldSet) {
            DescribeFieldResult describeFieldResult = DescribeCacheUtility.getFieldDescribe(sObjectDescribe.SObjectType, sObjectField);
            if (!describeFieldResult.isCreateable()) {
                String accessCreateableError = 'Some Error';
                System.debug(System.LoggingLevel.ERROR, accessCreateableError + sObjectDescribe.name + '.' + sObjectField.getDescribe().label + ' field.');
                throw new AuraHandledException(accessCreateableError + sObjectDescribe.name + '.' + sObjectField.getDescribe().label + ' field.');
            }
        }

        return true;
    }
}

}
