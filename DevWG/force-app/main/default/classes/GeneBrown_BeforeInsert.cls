public with sharing class GeneBrown_BeforeInsert implements TriggerAction.BeforeInsert{
    public void beforeInsert(List<SObject> newList){
        for(SObject record : newList){
            record.put('Name', 'Gene Brown - ' + System.now());
        }
    }
}