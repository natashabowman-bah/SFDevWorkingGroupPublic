@isTest
public class Knab1ServiceTest {
    @isTest
    static void setNameTest(){
        Knab_1__c k = new Knab_1__c();
        new Knab1Service().call('setName', new Map<String, Object>{'records' => new List<sObject>{k}});
        System.assert(k.Name == 'Kyle Knab - ' + System.now(), 'Expected name to be updated with timestamp.');
    }

    @isTest
    static void gettimestampTest(){
        Knab_1__c k = new Knab_1__c();
        ZD_VirtualCallable knabSvc = new Knab1Service();

        //setup mocked timestamp 7 days in future
        Datetime ts = System.now().addDays(7);
        ZD_Application.startMocking();
        knabSvc.when('getTimeStamp').thenReturn(ts);
        ZD_Application.stopMocking();

        Test.startTest();
        knabSvc.call('setName', new Map<String, Object>{'records' => new List<sObject>{k}});
        Test.stopTest();

        System.assert(k.Name == 'Kyle Knab - ' + ts, 'Expected name to be updated with mocked timestamp.');
    }
}