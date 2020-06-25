@isTest
global without sharing class CC_MockGeneration implements HttpCalloutMock {


    global CC_MockGeneration(){}
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        if (req.getEndpoint().equals('callout:CC_Challenge/test')) {
            System.assertEquals('callout:CC_Challenge/test', req.getEndpoint());
            System.assertEquals('GET', req.getMethod());
            // Create a fake response
            res.setBody('{"id":"sda"}');
            res.setStatusCode(200);
        }
        System.debug(req.getEndpoint());
        return res;

    }
}