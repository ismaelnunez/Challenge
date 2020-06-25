/*
* @description CC_Integration_Test test class for CC_Integration
* @author VASS
* @version 1.0
*/
@isTest
public with sharing class  CC_Integration_Test {

    @isTest
    public static void doCallout () {
        CC_MockGeneration mock = new CC_MockGeneration();
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
            HTTPResponse resp= CC_Integration.callout('Test', null, null);
            System.assertEquals(resp.getStatusCode(), 200);
        
        Test.stopTest();
       
    }
}