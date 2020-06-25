/*
* @description CC_CaseHelper Class the actions to execute for a Case
* @author Ismael
* @version 1.0
*/
public with sharing class CC_CaseHelper {

    public static void integrationStatusAdjustments(List<Case> lstNews, List<Case> lstOlds){

        //only 1 record, not call if load data in bulk
        if(lstNews.size()==1){
            if(lstNews[0].Status == 'PENDING_ACCEPTED' && lstOlds[0].Status == 'IN_PROGRESS'){
                HTTPResponse res = CC_Integration.callout('AdjustmentsPATCH', null, '/v1/adjustments/'+lstNews[0].CC_Adjustment_Id__c+'/status/'+lstNews[0].Status);
                CC_WrapperUtils.CC_AdjustmentsPatchResponse adjResponse = (CC_WrapperUtils.CC_AdjustmentsPatchResponse) JSON.deserialize(res.getBody(), CC_WrapperUtils.CC_AdjustmentsPatchResponse.class);
                List<Group> lstGroup = [SELECT Id FROM Group WHERE Name = :adjResponse.authorizationGroup and Type = 'Queue'];
                lstNews[0].OwnerId = lstGroup[0].Id;
            }

        }
        
    }

    public static void cloasedStatus(List<Case> lstNews, List<Case> lstOlds, Map<Id,Case> mapOlds){

        List<Case> lstValidate = new List<Case>();
        Set<Id> setIdsGroups = new Set<Id>();
        for(Case cs : lstNews){
            if(cs.Status == 'CLOSED' && mapOlds.get(cs.Id).Status == 'PENDING_ACCEPTED'){
                lstValidate.add(cs);
                setIdsGroups.add(cs.OwnerId);
            }
        }

        if(!lstValidate.isEmpty()){
            List<Group> lstGroup = [SELECT Id, (SELECT Id, UserOrGroupId FROM GroupMembers) FROM Group where Id IN :setIdsGroups];
            Map<String,Set<String>> mapGroupUser = new Map<String,Set<String>>();
            for(Group gp : lstGroup){
                Set<String> setUserId = new Set<String>();
                for(GroupMember gpMemb : gp.GroupMembers){
                    setUserId.add(gpMemb.UserOrGroupId);
                }
                mapGroupUser.put(gp.Id, setUserId);
            }

            for(Case cs : lstValidate){
                if(!mapGroupUser.get(cs.OwnerId).contains(UserInfo.getUserId())){
                    cs.addError('You dont have access to this case');
                }
            }
        }

        
    }
    
    public static void sendEmail(List<Case> lstNews, List<Case> lstOlds){
        //only 1 record, not send if load data in bulk
        if(lstNews.size()==1){
            if(lstNews[0].Status == 'PENDING_ACCEPTED' && lstOlds[0].Status == 'IN_PROGRESS'){

                Database.DmlOptions options = new Database.DmlOptions();
                options.emailHeader.triggerUserEmail = true;
                Case cs = new Case(id = lstNews[0].id, OwnerId = lstNews[0].OwnerId);
                Database.update(cs, options);
            }
        }
    }
}