@IsTest
public with sharing class AndrewBelzServiceTest {
    @IsTest
    public static void testSetName() {
        AndrewBelz__c ab = new AndrewBelz__c();
        List<SObject> recordList = new List<SObject>{ab};
        System.Callable svc = new AndrewBelzService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Andrew Belz - ' + System.now(), ab.Name);
    }

    @IsTest
    static void testSetNamePlusSeven() {
        AndrewBelz__c ab = new AndrewBelz__c();
        List<sObject> recordList = new List<sObject>{ab};

        ZD_VirtualCallable svc = new AndrewBelzService();
        ZD_Application.startMocking();
        DateTime mockedTS = System.now().addDays(7);
        svc.when('getTimeStamp').thenReturn(mockedTS);
        ZD_Application.stopMocking();

        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Andrew Belz - ' + mockedTS, ab.Name);
    }
}