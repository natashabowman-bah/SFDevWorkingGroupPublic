public with sharing class DevlinPrintMyName {
    public static String PrintMyName() {
        String name = 'Devlin';
        String printedSentence = 'Hi my name is: ' + name;
        System.debug(printedSentence);
        return printedSentence;

    }
}