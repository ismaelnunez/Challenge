({
    doSave : function(cmp, evt, helper) {
        var action = cmp.get("c.saveInfo");
        console.log('aqui2');
        action.setParams({ recordId : cmp.get("v.recordId"), amount : cmp.get('v.amount'), currencyIsoCode : cmp.get('v.currencyIsoCode')});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var ret = response.getReturnValue(); 
                console.log('aqui4',ret);
                if(ret.isOk){
                    $A.get('e.force:refreshView').fire();
                    cmp.destroy();
                }
                
            }else{
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
    }
})