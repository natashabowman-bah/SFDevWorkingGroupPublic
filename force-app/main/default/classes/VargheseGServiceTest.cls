@isTest
public with sharing class VargheseGServiceTest {
    @isTest
    public static void testSetName1(){
        vargheseg__c record = new vargheseg__c();
        List<SObject> recordList = new List<SObject>{record};
        System.Callable svc = new VargheseGService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Varghese George - ' + System.now(), record.Name);
    }

    @isTest
    public static void testSetName(){
        vargheseg__c record = new vargheseg__c();
        List<SObject> recordList = new List<SObject>{record};
        ZD_VirtualCallable svc = new VargheseGService();
        ZD_Application.startMocking();
        DateTime mockedTS = System.now().addDays(7);
        svc.when('getTimeStamp').thenReturn(mockedTS);
        ZD_Application.stopMocking();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Varghese George - ' + mockedTS, record.Name);
    }
}