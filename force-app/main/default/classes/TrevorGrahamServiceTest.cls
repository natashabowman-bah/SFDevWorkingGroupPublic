@isTest
public with sharing class TrevorGrahamServiceTest {
    @isTest
    public static void testSetName(){
        Graham_Trevor__c tg = new Graham_Trevor__c();
        List<SObject> recordList = new List<SObject>{tg};
        System.Callable svc = new TrevorGrahamService();
        svc.call('setname', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Trevor Graham - ' + System.now(), tg.Name);
    }

    @isTest
    public static void testSetNameMockedTimeStamp(){
        Graham_Trevor__c tg = new Graham_Trevor__c();
        List<SObject> recordList = new List<SObject>{tg};

        ZD_VirtualCallable svc = new TrevorGrahamService();
        ZD_Application.startMocking();
        DateTime mockedTS = System.now().addDays(7);
        svc.when('getTimeStamp').thenReturn(mockedTS);
        ZD_Application.stopMocking();

        svc.call('setName', new Map<String, Object>{'records' => recordList});
        Assert.areEqual('Trevor Graham - ' + mockedTS, tg.Name);
    }
    
}