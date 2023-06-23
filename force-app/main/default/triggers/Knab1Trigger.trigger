trigger Knab1Trigger on Knab_1__c (before insert, after insert, before update, after update, after delete, after undelete) {
    new MetadataTriggerHandler().run(); 
}