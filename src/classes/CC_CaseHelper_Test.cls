
/*
* @description CC_CaseHelper_Test test class for CC_CaseHelper
* @author VASS
* @version 1.0
*/
@isTest
public with sharing class  CC_CaseHelper_Test {
    @testSetup 
    public static void setup() {
        Account acc = new Account(Name = 'Ismael', CC_Customer_Id__c = 'q1243f3');
        insert acc;
        Case cs = new Case(AccountId = acc.Id, Status = 'IN_PROGRESS');
        insert cs;

    }

    @isTest
    public static void doUpdateCase () {
        List<Case> lstCs= [SELECT Id FROM Case];
        lstCs[0].Status = 'PENDING_ACCEPTED';
        update lstCs;

        lstCs[0].Status = 'CLOSED';
        update lstCs;
        //Validation OK
        System.assertEquals([SELECT id, Status FROM Case][0].Status, 'CLOSED');
       
    }
}