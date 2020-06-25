/*
* @description CC_Transactions_ctrl_Test test class for CC_Transactions_ctrl
* @author VASS
* @version 1.0
*/
@isTest
public with sharing class CC_Transactions_ctrl_Test {
   
    @testSetup 
    public static void setup() {
        Account acc = new Account(Name = 'Ismael', CC_Customer_Id__c = 'q1243f3');
        insert acc;
        
    }

    @isTest
    public static void doGetInfo () {
        List<Account> lstAcc= [SELECT Id FROM Account];
        Map<String,Object> mapInfo = CC_Transactions_ctrl.getInfo(lstAcc[0].Id);
        System.assertEquals(true, Boolean.valueOf(mapInfo.get('isOk')));
       
    }
}