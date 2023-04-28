public class Natasha_BeforeInsert implements TriggerAction.BeforeInsert {
  public void beforeInsert(List<SObject> newList){
        for(SObject sObj : newList){
            sObj.put('Name', 'Tash ' + System.now());
            sObj.put('Text__c', 'The time is: ' + System.now());

        }
    }
}