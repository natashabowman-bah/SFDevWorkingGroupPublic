trigger GeneBrownTrigger on Gene_Brown__c (before insert, after insert, before update, after update, after delete, after undelete) {
    new MetadataTriggerHandler().run();
}