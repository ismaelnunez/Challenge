/*
* @description CC_CaseHandler Class to manage and organize the actions to execute in the Case trigger events
* @author Ismael
* @version 1.0
*/
public with sharing class CC_CaseHandler {

    public void caseBeforeUpdate(List<Case> newCaseList, List<Case> oldCaseList, Map<Id,Case> oldCaseMap){
        CC_CaseHelper.integrationStatusAdjustments(newCaseList,oldCaseList);
        CC_CaseHelper.cloasedStatus(newCaseList,oldCaseList, oldCaseMap);
    }

    public void caseAfterUpdate(List<Case> newCaseList, List<Case> oldCaseList){
        CC_CaseHelper.sendEmail(newCaseList,oldCaseList);
    }
}