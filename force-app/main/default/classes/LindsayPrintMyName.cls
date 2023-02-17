public with sharing class LindsayPrintMyName {
    public LindsayPrintMyName() {
        String name = 'Lindsay';
        String printedSentence = 'Hi my name is: ' + name;
        System.debug(printedSentence);
        return printedSentence;
    }
}