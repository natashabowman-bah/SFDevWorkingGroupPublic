@isTest
public with sharing class JonDevlinServiceTest {
    
    @isTest
    public static void testSetName(){
        Jon_Devlin__c jd = new Jon_Devlin__c();
        List<SObject> recordList = new List<SObject>{jd};
        System.Callable svc = new JonDevlinService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Jon Devlin - ' + System.now(), jd.Name);
    }
}