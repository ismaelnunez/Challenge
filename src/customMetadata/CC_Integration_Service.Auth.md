<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Auth</label>
    <protected>false</protected>
    <values>
        <field>CC_Endpoint__c</field>
        <value xsi:type="xsd:string">callout:CC_Challenge/salesforce/oauth/token</value>
    </values>
    <values>
        <field>CC_Method__c</field>
        <value xsi:type="xsd:string">POST</value>
    </values>
    <values>
        <field>CC_Mock__c</field>
        <value xsi:type="xsd:string">{
  &quot;accessToken&quot;: &quot;string&quot;,
  &quot;expiresIn&quot;: 0,
  &quot;inactiveTime&quot;: 0
}</value>
    </values>
    <values>
        <field>CC_Retrieve_Mock__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>CC_Timeout__c</field>
        <value xsi:type="xsd:double">10000.0</value>
    </values>
</CustomMetadata>
