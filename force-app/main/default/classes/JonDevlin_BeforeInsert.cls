public with sharing class JonDevlin_BeforeInsert implements TriggerAction.BeforeInsert{
    public JonDevlin_BeforeInsert() {

    }

    public void beforeInsert(List<SObject> newList){
        System.Callable jonDevlinSvc = new JonDevlinService();
        jonDevlinSvc.call('setName', new Map<String,Object>{'records' => newList});
        //jonDevlinSvc.setName(newList);
    }


}