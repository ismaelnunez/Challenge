/*
* @description CC_Transactions_ctrl Transactions class that get info into webservice
* @author Ismael
* @version 1.0
*/
public with sharing class CC_Transactions_ctrl {

    @AuraEnabled
    public static Map<String,Object> getInfo(String recordId){
        Map<String,Object> mapReturn = new Map<String,Object>();
        List<Account> lstAccount = [SELECT Id, CC_Customer_Id__c FROM Account WHERE Id = :recordId];
        if(!lstAccount.isEmpty()){
            HTTPResponse res = CC_Integration.callout('Transactions', null, lstAccount[0].CC_Customer_Id__c);
            mapReturn.put('body', res.getBody());
        }
        
        mapReturn.put('isOk', true);
        
        return mapReturn;
    }
}