public with sharing class GBPrintName {
    public static String PrintMyName(String name){
        name = name != null ? name : 'Gene';
        String printedSentence = 'Hi my name is: ' + name;
        System.debug(printedSentence);
        return printedSentence;
    }
}