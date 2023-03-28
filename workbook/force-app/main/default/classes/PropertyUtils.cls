public with sharing class PropertyUtils {

    @AuraEnabled(cacheable=true)
    public static List<MapMarker> getPropertyAddress(id recId) {
        workshop230327__Property__c prop = [SELECT Name, workshop230327__street__c, workshop230327__city__c, workshop230327__state__c, workshop230327__country__c, workshop230327__Postal_Code__c FROM workshop230327__Property__c WHERE id =: recId][0]; 
        Location loc = new Location(prop.workshop230327__street__c, prop.workshop230327__city__c, prop.workshop230327__state__c, prop.workshop230327__Postal_Code__c, prop.workshop230327__country__c);
        MapMarker mark = new MapMarker('icon', prop.Name, 'description', loc);
        List<MapMarker> locs = new List<MapMarker>{mark};
        return locs;
    }

    public class MapMarker{
 
        @AuraEnabled
        public String icon; 
 
        @AuraEnabled
        public String title; 
 
        @AuraEnabled
        public String description;
 
        @AuraEnabled
        public Location location;

        public MapMarker(String i, String t, String d, Location l) {
            icon = i;
            title = t;
            description = d;
            location = l;
        }
    }

    public class Location{
        
        @AuraEnabled
        public String Street;
 
        @AuraEnabled
        public String PostalCode;
    
        @AuraEnabled
        public String City;
 
        @AuraEnabled
        public String State;
 
        @AuraEnabled
        public String Country;
 
        public Location(String strt, String cit, String stat, String pc, String ctry){
            Street = strt;
            City = cit;
            State = stat;
            PostalCode = pc;
            Country = ctry;
        }
    }
}