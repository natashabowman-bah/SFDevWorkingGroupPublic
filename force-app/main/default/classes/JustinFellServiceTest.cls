@isTest
public with sharing class JustinFellServiceTest {
    @isTest
    public static void testSetName(){
        Justin_Fell__c jf = new Justin_Fell__c();
        List<SObject> recordList = new List<SObject>{jf};
        System.Callable svc = new JustinFellService();
        svc.call('setName', new Map<String, Object>{'records' => recordList});
        Assert.areEqual('Justin Fell - ' + System.now(), jf.name);
    }
}