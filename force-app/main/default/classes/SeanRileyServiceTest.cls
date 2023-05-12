@isTest
public class SeanRileyServiceTest {
    
    @isTest
    public static void testSetName(){
        Sean_Riley__c sr = new Sean_Riley__c();
        List<SObject> recordList = new List<SObject>{sr};
        System.Callable svc = new SeanRileyService();
        svc.call('setName', new Map<String,Object>{'records' => recordList});
        Assert.areEqual('Sean Riley - ' + System.now(), sr.Name);
    }

}