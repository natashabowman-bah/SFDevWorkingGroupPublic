@isTest
public with sharing class JesseServiceTest {
	@isTest
	public static void testSetName() {
		jesse__c j = new Jesse__c();
		List<SObject> recordList = new List<SObject>{ j };
		System.Callable svc = new JesseService();
		svc.call('setName', new Map<String, Object>{ 'records' => recordList });
		Assert.areEqual('Jesse - ' + System.now(), j.Name);
	}

	@isTest
	public static void testSetNameCallable() {
		Jesse__c j = new Jesse__c();
		List<SObject> recordList = new List<SObject>{ j };

		ZD_VirtualCallable svc = new JesseService();
		ZD_Application.startMocking();
		DateTime mockedTS = System.now().addDays(7);
		svc.when('getTimeStamp').thenReturn(mockedTS);
		ZD_Application.stopMocking();
	}
}
