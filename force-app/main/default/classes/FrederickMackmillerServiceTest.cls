@isTest
public with sharing class FrederickMackmillerServiceTest {
    @isTest
    public static void testSetName(){
        c__c fm = new c__c();
        List<SObject> recordList = new List<SObject>{fm};
        System.Callable svc = new FrederickMackmillerService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Frederick Mackmiller - ' + System.now(), fm.Name);
    }
}