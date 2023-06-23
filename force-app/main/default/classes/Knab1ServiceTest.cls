@isTest
public class Knab1ServiceTest {
    @isTest
    static void setNameTest(){
        Knab_1__c k = new Knab_1__c();
        new Knab1Service().call('setName', new Map<String, Object>{'records' => new List<sObject>{k}});
        System.assert(k.Name == 'Kyle Knab - ' + System.now(), 'Expected name to be updated with timestamp.');
    }
}