/*
* @description CC_NewAdjustment_ctrl controller class that create case and call webservice
* @author Ismael
* @version 1.0
*/
public with sharing class CC_NewAdjustment_ctrl {
    @AuraEnabled
    public static Map<String,Object> saveInfo(String recordId, Decimal amount, String currencyIsoCode){
        Map<String,Object> mapReturn = new Map<String,Object>();
        List<Account> lstAccount = [SELECT Id, CC_Customer_Id__c FROM Account WHERE Id = :recordId];
        if(!lstAccount.isEmpty()){
            CC_WrapperUtils.CC_AdjustmentRequest adjWr = new CC_WrapperUtils.CC_AdjustmentRequest();
            CC_WrapperUtils.CC_Amount amWr = new CC_WrapperUtils.CC_Amount();
            amWr.amount = String.valueOf(amount);
            amWr.currency_str = currencyIsoCode;
            adjWr.amount = amWr;
            adjWr.accountId = lstAccount[0].CC_Customer_Id__c;
            adjWr.adjustmentStatus = amount>1000?'IN_PROGRESS':'CLOSED';
            HTTPResponse res = CC_Integration.callout('Adjustment', JSON.serialize(adjWr), null);
            CC_WrapperUtils.CC_AdjustmentResponse adjResponse = (CC_WrapperUtils.CC_AdjustmentResponse) JSON.deserialize(res.getBody(), CC_WrapperUtils.CC_AdjustmentResponse.class);

            //Create case
            Case cs = new Case(     
                                AccountId = recordId, 
                                Status = amount>1000?'IN_PROGRESS':'CLOSED',
                                CC_Adjustment_Id__c = adjResponse.adjustmentId
                            );
            insert cs;

        
            mapReturn.put('isOk', true);
        }else{
            mapReturn.put('isOk', false);
        }
        
        
        return mapReturn;
    }
}