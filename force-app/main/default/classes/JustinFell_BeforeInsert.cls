public with sharing class JustinFell_BeforeInsert implements TriggerAction.BeforeInsert{
    public JustinFell_BeforeInsert() {

    }
    public void beforeInsert(List<SObject> newList){
        System.Callable svc = new JustinFellService();
        svc.call('setName', new Map<String, Object>{'records' => newList});

    }
}