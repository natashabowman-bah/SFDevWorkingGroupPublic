@isTest
public class SeanRileyServiceTest {
    
    @isTest
    public static void testSetName(){
        Sean_Riley__c sr = new Sean_Riley__c();
        List<SObject> recordList = new List<SObject>{sr};
        System.Callable svc = new SeanRileyService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Sean Riley - ' + System.now(), sr.Name);
    }

    @isTest
    public static void testSetName1(){
        Sean_Riley__c sr = new Sean_Riley__c();
        List<SObject> recordList = new List<SObject>{sr};
        ZD_VirtualCallable svc = new SeanRileyService();
        ZD_Application.startMocking();
        DateTime mockedTS = System.now().addDays(7);
        svc.when('getTimeStamp').thenReturn(mockedTS);
        ZD_Application.stopMocking();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Sean Riley - ' + mockedTS, sr.Name);
    } 

}