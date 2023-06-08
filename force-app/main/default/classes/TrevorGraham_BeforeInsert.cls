public with sharing class TrevorGraham_BeforeInsert implements TriggerAction.BeforeInsert {
    public void beforeInsert(List<SObject> newList) {
        System.Callable svc = new TrevorGrahamService();
        svc.call('setName', new Map<String,Object>{'records' => newList});
    }
}