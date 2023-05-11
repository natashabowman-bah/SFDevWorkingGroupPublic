@isTest
public with sharing class GeneBrownServiceTest {
    @isTest
    public static void testSetName(){
        Gene_Brown__c gb = new Gene_Brown__c();
        List<SObject> recordList = new List<SObject>{gb};
        System.Callable svc = new GeneBrownService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Gene Brown - ' + System.now(), gb.Name);
    }

}