public with sharing class CoryGerrits_BeforeInsert implements TriggerAction.BeforeInsert{
    public CoryGerrits_BeforeInsert() {

    }

    public void beforeInsert(List<SObject> newList){
        for(SObject sObj : newList){
            sObj.put('Name', 'Cory Gerrits ' + System.now());
        }
    }
    
}