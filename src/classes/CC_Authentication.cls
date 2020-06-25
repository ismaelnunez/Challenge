/*
* @description CC_Integration Authentication class
* @author Ismael
* @version 1.0
*/
public with sharing class CC_Authentication {
    
    public static Boolean isAuthenticated(){
        Boolean isAuth = false;
        Cache.OrgPartition orgPart = Cache.Org.getPartition('Cache');

        if(orgPart.get('token')!= null){
            isAuth = true;
        }
        return isAuth;
    }

    public static HttpRequest applySecurity(){
        Boolean isAuth = isAuthenticated();
        HttpRequest req = new HttpRequest();
        if(isAuth){
            Cache.OrgPartition orgPart = Cache.Org.getPartition('Cache');
            req.setHeader('token',String.valueOf(orgPart.get('token')));
        }else{
            CC_AuthResponse authRes = addTokenService('Auth');
            Cache.OrgPartition orgPart = Cache.Org.getPartition('Cache');
            orgPart.put('token', authRes.accessToken);
            req.setHeader('token',authRes.accessToken);
        }
        return req;
    }

    public static CC_AuthResponse addTokenService(String authConfigName){
        CC_Integration_Service__mdt integrationConfigAuth = [SELECT CC_Endpoint__c, CC_Mock__c, CC_Retrieve_Mock__c, DeveloperName, CC_Method__c FROM CC_Integration_Service__mdt WHERE DeveloperName = :authConfigName LIMIT 1];
        HTTPResponse res = null;
        if(integrationConfigAuth.CC_Retrieve_Mock__c){
            res = new HTTPResponse();
            res.setBody(integrationConfigAuth.CC_Mock__c);
        }else{
            //comment 
            /*HttpRequest httpReqAuth = new HttpRequest();
            httpReqAuth.setMethod(integrationConfigAuth.CC_Method__c);
            httpReqAuth.setEndpoint(integrationConfigAuth.CC_Endpoint__c);
            CC_AuthRequest authWrapper = new CC_AuthRequest();
            authWrapper.token = 'string123';
            httpReqAuth.setBody(JSON.serialize(authWrapper));

            Http http = new Http();
            res = http.send(httpReqAuth);*/
        }

        CC_AuthResponse authResponse = (CC_Authentication.CC_AuthResponse) JSON.deserialize(res.getBody(), CC_Authentication.CC_AuthResponse.class);
        System.debug(authResponse);
        return authResponse;
    }

    public class CC_AuthRequest{
        public String token;
    }

    public class CC_AuthResponse{
        public String accessToken;
        public Decimal expiresIn;
        public Decimal inactiveTime;
    }
}