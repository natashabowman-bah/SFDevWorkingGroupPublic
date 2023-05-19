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
}
