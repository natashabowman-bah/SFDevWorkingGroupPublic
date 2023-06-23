public with sharing class Knab1_BeforeInsert implements TriggerAction.BeforeInsert {
    public Knab1_BeforeInsert() {

    }

    public void beforeInsert(List<SObject> newList){
        /* for(SObject record : newList){
            record.put('Name', 'Kyle Knab ' + DateTime.now());
        } */

        new Knab1Service().call('setName', new Map<String, Object>{'records' => newList});
    }
}