public with sharing class CodeyFeature {

    public void invoke(String someStr) {
        Codey_Obj__c obj = createCodeyObj(someStr);

        // further steps to create request
        RequestHandler handler = new RequestHandler();
        CodeyRequest request = handler.createRequest(obj);
        handler.post(request);
    }
    
    Codey_Obj__c createSimpleObj(String someStr) {
        Codey_Obj__c obj = new Codey_Obj__c(Field1__c = someStr);
        return obj;
    }

    Codey_Obj__c createCodeyObj(String someStr) {
        Codey_Obj__c obj = new Codey_Obj__c();
        obj.field1__c = doubleInput(someStr.length());
        obj.field2__c = doubleString(someStr);
        return obj;
    }

    private String doubleInput(Integer input) {
        return '' + (input * 2);
    }

    private String doubleString(String input) {
        return input + input;
    }

}
