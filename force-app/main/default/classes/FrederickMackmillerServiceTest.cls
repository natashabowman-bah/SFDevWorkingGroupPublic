@isTest
public with sharing class FrederickMackmillerServiceTest {
  @isTest
  public static void testSetName0() {
    c__c fm = new c__c();
    List<SObject> recordList = new List<SObject>{ fm };
    System.Callable svc = new FrederickMackmillerService();
    svc.call('setName', new Map<String, Object>{ 'records' => recordList });
    Assert.areEqual('Frederick Mackmiller - ' + System.now(), fm.Name);
  }
  @isTest
  public static void testSetName() {
    c__c fm = new c__c();
    List<SObject> recordList = new List<SObject>{ fm };
    ZD_VirtualCallable svc = new FrederickMackmillerService();
    ZD_Application.startMocking();
    DateTime mockedTS = System.now().addDays(7);
    svc.when('getTimeStamp').thenReturn(mockedTS);
    ZD_Application.stopMocking();
    svc.call('setName', new Map<String, Object>{ 'records' => recordList });
    Assert.areEqual('Frederick Mackmiller - ' + mockedTS, fm.Name);
  }

  /*

     ZD_VirtualCallable svc = new JonDevlinService();
 ZD_Application.startMocking();
 DateTime mockedTS = System.now().addDays(7);
 svc.when('getTimeStamp').thenReturn(mockedTS);
 ZD_Application.stopMocking();

    */
}
