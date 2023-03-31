public with sharing class JonDevlin_BeforeInsert implements TriggerAction.BeforeInsert{
    public JonDevlin_BeforeInsert() {

    }

    public void beforeInsert(List<SObject> newList){
        for(SObject sObj : newList){
            sObj.put('Name', 'Jon Devlin ' + System.now());
        }
    }


}