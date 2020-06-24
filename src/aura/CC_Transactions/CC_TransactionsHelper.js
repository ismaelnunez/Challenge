({
    doInit : function(cmp, evt, helper) {
        var action = cmp.get("c.getInfo");
        action.setParams({ recordId : cmp.get("v.recordId")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var ret = response.getReturnValue(); 
                if(ret.isOk){
                    console.log('ret', ret);
                    console.log(JSON.parse(ret.body));
                    var responseList = JSON.parse(ret.body);
                    var jsonPanel = [];
                    for(var i in responseList){
                        var data = [];
                        for(var j in responseList[i].transactions){
                            var row = {
                                'amount': responseList[i].transactions[j].amount.amount,
                                'CurrencyIsoCode': responseList[i].transactions[j].amount.currency,
                                'balanceType': responseList[i].transactions[j].balanceType,
                                'name': responseList[i].transactions[j].name,
                                'resourceId': responseList[i].transactions[j].resourceId,
                                'transactionDate': responseList[i].transactions[j].transactionDate
                            };
                            data.push(row);
                        }
                        console.log(data);
                        var item =  {   'title': responseList[i].iban,
                                        'field1': responseList[i].accountStatus,
                                        'field2': responseList[i].product,
                                        'dataList': data
                                    };
                        jsonPanel.push(item);
                    }
                    console.log(jsonPanel);
                    cmp.set('v.jsonPanel', jsonPanel);

                }
                
            }else{
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
    }
})