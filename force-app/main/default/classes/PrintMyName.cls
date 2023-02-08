public with sharing class PrintMyName {
    public static String PrintMyName() {
        String name = 'Natasha';
        String printedSentence = 'Hi my name is: ' + name;
        System.debug(printedSentence);
        return printedSentence;

    }
}