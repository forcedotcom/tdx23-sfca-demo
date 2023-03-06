public with sharing class CodeyFeature {

    public void invoke(String name) {
        Codey_Obj__c obj = createCodeyObj(name);

        // further steps to create request
        RequestHandler handler = new RequestHandler();
        CodeyRequest request = handler.createRequest(obj);
        handler.post(handler);
    }
    
    Codey_Obj__c createSimpleObj(String name) {
        Codey_Obj__c obj = new Codey_Obj__c(Name = name);
        return obj;
    }

    Codey_Obj__c createCodeyObj(String name) {
        Codey_Obj__c obj = new Codey_Obj__c();
        obj.Name = name;
        obj.field1__c = doubleInput(name.length);
        obj.field2__c = doubleString(name);
        return obj;
    }

    private Integer doubleInput(Integer input) {
        return input * 2;
    }

    private String doubleString(String input) {
        return input + input;
    }

}
