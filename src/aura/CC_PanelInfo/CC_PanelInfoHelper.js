({
    createModal : function(cmp, evt, helper) {
        console.log(cmp.get('v.recordId'));
        $A.createComponent(
            "c:CC_NewAdjustment",
            {
                'title':'New Adjustment',
                'recordId':cmp.get('v.recordId')
            },
            function(newCmp, status, errorMessage){
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newCmp);
                    console.log('push');
                    cmp.set("v.body", body);
                }
            }
        );
    }
})