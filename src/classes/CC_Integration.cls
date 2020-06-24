/*
* @description CC_Integration integration engine class
* @author Ismael
* @version 1.0
*/
public with sharing class CC_Integration {

    public static HTTPResponse callout(String integrationDevelopName, String body, String queryParam){
        CC_Integration_Service__mdt integrationConfig = [SELECT CC_Endpoint__c, CC_Mock__c, CC_Retrieve_Mock__c, DeveloperName FROM CC_Integration_Service__mdt WHERE DeveloperName = :integrationDevelopName LIMIT 1];
        HttpRequest httpReq = CC_Authentication.applySecurity();
        HTTPResponse res = null;
        if(integrationConfig.CC_Retrieve_Mock__c){
            res = new HTTPResponse();
            res.setBody(integrationConfig.CC_Mock__c);
        }else{
            httpReq.setBody(body);
            httpReq.setMethod(integrationConfig.CC_Method__c);
            httpReq.setEndpoint(integrationConfig.CC_Endpoint__c + queryParam);

            Http http = new Http();
            res = http.send(httpReq);
        }

        return res;

    }

}