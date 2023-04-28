public with sharing class JonDevlin2_BeforeInsert implements TriggerAction.BeforeInsert{
    public void beforeInsert(List<SObject> newList){
        for(SObject record : newList){
            record.put('Name', 'Jon Devlin 2 - ' + System.now());
        }
    }
}