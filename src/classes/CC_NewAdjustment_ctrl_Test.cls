
/*
* @description CC_NewAdjustment_ctrl_Test test class for CC_NewAdjustment_ctrl
* @author VASS
* @version 1.0
*/
@isTest
public with sharing class CC_NewAdjustment_ctrl_Test {
   
    @testSetup 
    public static void setup() {
        Account acc = new Account(Name = 'Ismael', CC_Customer_Id__c = 'q1243f3');
        insert acc;
        
    }

    @isTest
    public static void doSaveOk () {
        List<Account> lstAcc= [SELECT Id FROM Account];
        Map<String,Object> mapInfo = CC_NewAdjustment_ctrl.saveInfo(lstAcc[0].Id, 1001, 'EUR');
        System.assertEquals(true, Boolean.valueOf(mapInfo.get('isOk')));
       
    }

    @isTest
    public static void doSaveKo () {
        Map<String,Object> mapInfo = CC_NewAdjustment_ctrl.saveInfo('aaaa', 1001, 'EUR');
        System.assertEquals(false, Boolean.valueOf(mapInfo.get('isOk')));
       
    }

}