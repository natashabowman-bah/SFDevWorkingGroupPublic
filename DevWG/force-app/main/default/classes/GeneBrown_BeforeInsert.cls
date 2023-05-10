public with sharing class GeneBrown_BeforeInsert implements TriggerAction.BeforeInsert{
    public void beforeInsert(List<SObject> newList){
        System.Callable svc = new GeneBrownService();
        svc.call('setName', new Map<String,Object>{'records' => newList});
    }
}