public with sharing class FrederickMackmiller2_BeforeInsert implements TriggerAction.BeforeInsert{
    public void beforeInsert(List<SObject> newList){
        for(SObject record : newList){
            //record.put('Name', 'Frederick Mackmiller 2- ' + System.now());
            System.Callable svc = new FrederickMackmillerService();
            svc.call('setName', new Map<String,Object>{'records' => newList});
        
        }
    }

}