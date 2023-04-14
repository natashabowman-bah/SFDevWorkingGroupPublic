trigger JonDevlin2Trigger on Jon_Devlin2__c (before insert, after insert, before update, after update, after delete, after undelete) {
    new MetadataTriggerHandler().run();
}