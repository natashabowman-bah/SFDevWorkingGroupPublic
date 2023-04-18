trigger FrederickMackmillerTrigger on c__c (before insert, after insert, before update, after update, after delete, after undelete) {
    new MetadataTriggerHandler().run();
}