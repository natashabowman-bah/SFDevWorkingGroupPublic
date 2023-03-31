public class Natasha_BeforeInsert implements TriggerAction.BeforeInsert {
  public void beforeInsert(List<SObject> newList){
        for(SObject sObj : newList){
            sObj.put('Name', 'Jon Devlin ' + System.now());
        }
    }
}