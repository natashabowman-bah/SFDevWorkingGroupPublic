@isTest
public with sharing class TrevorGrahamServiceTest {
    @isTest
    public static void testSetName(){
        Graham_Trevor__c tg = new Graham_Trevor__c();
        List<SObject> recordList = new List<SObject>{tg};
        System.Callable svc = new TrevorGrahamService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Trevor Graham - ' + System.now(), tg.Name);
    }
}