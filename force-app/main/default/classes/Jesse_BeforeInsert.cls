public with sharing class Jesse_BeforeInsert implements TriggerAction.beforeInsert {
	public void beforeInsert(List<SObject> newList) {
		System.Callable svc = new JesseService();
		svc.call('setName', new Map<String, Object>{ 'records' => newList });
	}
}
