<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Transactions</label>
    <protected>false</protected>
    <values>
        <field>CC_Endpoint__c</field>
        <value xsi:type="xsd:string">callout:CC_Challenge/v1/transactions/{customerId}</value>
    </values>
    <values>
        <field>CC_Method__c</field>
        <value xsi:type="xsd:string">GET</value>
    </values>
    <values>
        <field>CC_Mock__c</field>
        <value xsi:type="xsd:string">[
  {
    &quot;iban&quot;: &quot;ES4700759339324669344918&quot;,
    &quot;accountStatus&quot;: &quot;enabled&quot;,
    &quot;product&quot;: &quot;current&quot;,
    &quot;transactions&quot;: [
      {
        &quot;resourceId&quot;: 1234567890,
        &quot;name&quot;: &quot;Supermarket&quot;,
        &quot;balanceType&quot;: &quot;closingBooked&quot;,
        &quot;amount&quot;: {
          &quot;amount&quot;: &quot;215&quot;,
          &quot;currency&quot;: &quot;EUR&quot;
        },
        &quot;transactionDate&quot;: &quot;2020-04-25T15:30:35.035Z&quot;
      },
 {
        &quot;resourceId&quot;: 1234567891,
        &quot;name&quot;: &quot;Supermarket&quot;,
        &quot;balanceType&quot;: &quot;closingBooked&quot;,
        &quot;amount&quot;: {
          &quot;amount&quot;: &quot;45&quot;,
          &quot;currency&quot;: &quot;USD&quot;
        },
        &quot;transactionDate&quot;: &quot;2020-04-28T15:30:35.035Z&quot;
      }
    ]
  },
 {
    &quot;iban&quot;: &quot;ES4700759339324111111118&quot;,
    &quot;accountStatus&quot;: &quot;enabled&quot;,
    &quot;product&quot;: &quot;saving&quot;,
    &quot;transactions&quot;: [
      {
        &quot;resourceId&quot;: 1234567890,
        &quot;name&quot;: &quot;Supermarket&quot;,
        &quot;balanceType&quot;: &quot;closingBooked&quot;,
        &quot;amount&quot;: {
          &quot;amount&quot;: &quot;765&quot;,
          &quot;currency&quot;: &quot;EUR&quot;
        },
        &quot;transactionDate&quot;: &quot;2020-04-25T15:30:35.035Z&quot;
      },
 {
        &quot;resourceId&quot;: 1234567891,
        &quot;name&quot;: &quot;Supermarket&quot;,
        &quot;balanceType&quot;: &quot;closingBooked&quot;,
        &quot;amount&quot;: {
          &quot;amount&quot;: &quot;435&quot;,
          &quot;currency&quot;: &quot;EUR&quot;
        },
        &quot;transactionDate&quot;: &quot;2020-04-28T15:30:35.035Z&quot;
      }
    ]
  }
]</value>
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
