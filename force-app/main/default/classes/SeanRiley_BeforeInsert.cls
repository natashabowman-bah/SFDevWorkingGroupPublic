public with sharing class SeanRiley_BeforeInsert implements TriggerAction.BeforeInsert {
    public SeanRiley_BeforeInsert() {

    }

    public void beforeInsert(List<SObject> newList){
        System.Callable svc = new SeanRileyService();
        svc.call('setName', new Map<String,Object>{'records' => newList});
    }
}