public with sharing class CodeyFeature {

    public void invoke(String someStr) {
        LogEvent__c obj = createCodeyObj(someStr);

        // further steps to create request
        RequestHandler handler = new RequestHandler();
        CodeyRequest request = handler.createRequest(obj);
        handler.post(request);
    }
    
    LogEvent__c createSimpleObj(String someStr) {
        LogEvent__c obj = new LogEvent__c(Quiddity__c = someStr);
        return obj;
    }

    LogEvent__c createCodeyObj(String someStr) {
        LogEvent__c obj = new LogEvent__c();
        obj.Quiddity__c = doubleInput(someStr.length());
        obj.Log_Data__c = doubleString(someStr);
        return obj;
    }

    private String doubleInput(Integer input) {
        return '' + (input * 2);
    }

    private String doubleString(String input) {
        return input + input;
    }

}
