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

    @isTest
    public static void testSetNameMockTimeStamp(){
        Justin_Fell__c jf = new Justin_Fell__c();
        List<SObject> recordList = new List<SObject>{jf};

        ZD_VirtualCallable svc = new JustinFellService();
        ZD_Application.startMocking();
        DateTime mockedTS = system.now().addDays(7);
        svc.when('getTimeStamp').thenReturn(mockedTS);
        ZD_Application.stopMocking();

        svc.call('setName', new Map<String, Object>{'records' => recordList});
        Assert.areEqual('Justin Fell - ' + mockedTS, jf.name);
    }
}