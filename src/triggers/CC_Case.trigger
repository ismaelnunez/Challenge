trigger CC_Case on Case (before update, after update) {
    CC_CaseHandler handler = new CC_CaseHandler();
    if(trigger.isBefore){
        if(trigger.isUpdate){
            handler.caseBeforeUpdate(trigger.new, trigger.old, trigger.oldMap);
        }
    }else if(trigger.isAfter){
        if(trigger.isUpdate){
            handler.caseAfterUpdate(trigger.new, trigger.old);
        }
    }
}