/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-17-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TJprintName {
    public static String PrintMyName() {
        String name = 'TJ';
        String printedSentence = 'Hi my name is: ' + name;
        System.debug(printedSentence);
        return printedSentence;

    }
    
}