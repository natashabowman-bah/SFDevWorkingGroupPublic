/**
 * @description       : 
 * @author            : knab_kyle@bah.com
 * @group             : Booz Allen Hamilton
 * @last modified on  : 02-08-2023
 * @last modified by  : knab_kyle@bah.com 
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   02-08-2023   knab_kyle@bah.com   Added overload to PrintMyName()
**/
public with sharing class PrintMyName {
    /**
    * @description Prints name of current user
    * @author knab_kyle@bah.com | 02-08-2023 
    * @return String 
    **/
    public static String PrintMyName() {
        return PrintMyName(UserInfo.getFirstName());
    }

    /**
    * @description Prints whatever name is passed to it, or 'Natasha' by default
    * @author knab_kyle@bah.com | 02-08-2023 
    * @param String name 
    * @return String 
    **/
    public static String PrintMyName(String name){
        name = name != null ? name : 'Natasha';
        String printedSentence = 'Hi my name is: ' + name;
        System.debug(printedSentence);
        return printedSentence;
    }
}