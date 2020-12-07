public with sharing class CalendarController {

    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getCalendarHolidays(String year){
        Map<String, Object> results =  new Map<String, Object>();
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            calendarific_key__mdt calendarific = [SELECT api_key__c from calendarific_key__mdt where MasterLabel = 'gmineroskey'];
            request.setEndpoint('https://calendarific.com/api/v2/holidays?api_key='+calendarific.api_key__c+'&country=CA&type=national&year='+year);
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            if (response.getStatusCode() == 200) {
                // Deserialize the JSON string into collections of primitive data types.
                results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            }
            return results;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static String getFavoriteList(){
        String holidays;
        try{
            User userHolidays = [SELECT id, favorite_holidays__c from User where id =:UserInfo.getUserId()];
            holidays = userHolidays.favorite_holidays__c;
            
            return holidays;
        }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String updateFavoriteList(String holidayList){
        String holidays = holidayList;
        if(holidays != null){
            try{
                User userToUpdate;
                userToUpdate = [SELECT id, favorite_holidays__c from User where id =:UserInfo.getUserId()];
                userToUpdate.favorite_holidays__c = holidays;
                update userToUpdate;
                return 'Success: Favorite List updated successfully';
            }
            catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
        return 'nothing to update';
    }

}
