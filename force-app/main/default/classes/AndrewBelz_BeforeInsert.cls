public with sharing class AndrewBelz_BeforeInsert implements TriggerAction.BeforeInsert {
    public void BeforeInsert(List<SObject> myList) {
        System.Callable andrewBelzSvc = new AndrewBelzService();
        andrewBelzSvc.call('setName', new Map<String,Object>{'records' => myList});
    }
}