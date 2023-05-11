public with sharing class frederickMackmiller_BeforeInsert implements TriggerAction.BeforeInsert{
    public void beforeInsert(List<SObject> newList){
        for(SObject record : newList){
            record.put('Name', 'Frederick Mackmiller - ' + System.now());
        }
    }

}