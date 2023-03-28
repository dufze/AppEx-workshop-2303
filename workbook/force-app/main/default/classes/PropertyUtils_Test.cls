@isTest
public with sharing class PropertyUtils_Test {
    @testSetup
    static void propertyUtilsTestSetup(){
        workshop230327__property__c property = new workshop230327__property__c(
        workshop230327__street__c = '415 Mission St',
        workshop230327__City__c = 'San Francisco',
        workshop230327__Postal_Code__c = 'CA 94105',
        workshop230327__Country__c = 'United States');
        insert property; 
    }
    
    @isTest
    static void getPropertyAddressTest() {
    
        workshop230327__property__c property = [SELECT id FROM workshop230327__property__c][0];
        test.startTest();
        propertyUtils.MapMarker result = PropertyUtils.getPropertyAddress(property.id)[0];
        test.stopTest();
     
        system.assert(result.location.Street == '415 Mission St');
        system.assert(result.location.City == 'San Francisco');
        system.assert(result.location.PostalCode == 'CA 94105');
        system.assert(result.location.Country == 'United States');
    }
}