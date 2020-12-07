@isTest
public with sharing class CalendarControllerTest {

     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new CalendarMockHttpResponseGenerator());
        try{
            // Call method to test fake response to be sent
            // from the class that implements HttpCalloutMock. 
            Map<String, Object> res = CalendarController.getCalendarHolidays('2020');
            // Verify response received contains value
            Map<String, Object> expectedValue = (Map<String, Object>)JSON.deserializeUntyped('{"meta":{"code":200},"response":{"holidays":[{"name":"New Year\'s Day","description":"New Year\'s Day is the first day of a new year according to the Gregorian calendar used in Canada and many other countries.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-01-01","datetime":{"year":2020,"month":1,"day":1}},"type":["National holiday"],"locations":"All","states":"All"},{"name":"Good Friday","description":"On Good Friday, Christians commemorate the crucifixion of Jesus Christ and it is a statutory holiday in many parts of Canada.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-04-10","datetime":{"year":2020,"month":4,"day":10}},"type":["National holiday","Christian"],"locations":"All","states":"All"},{"name":"Easter Monday","description":"Easter Monday is the day after Easter Sunday and a holiday for many Canadians.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-04-13","datetime":{"year":2020,"month":4,"day":13}},"type":["National holiday"],"locations":"NB, NT, NU, QC","states":[{"id":60,"abbrev":"NB","name":"New Brunswick","exception":null,"iso":"ca-nb"},{"id":62,"abbrev":"NT","name":"Northwest Territories","exception":null,"iso":"ca-nt"},{"id":64,"abbrev":"NU","name":"Nunavut","exception":null,"iso":"ca-nu"},{"id":67,"abbrev":"QC","name":"Quebec","exception":null,"iso":"ca-qc"}]},{"name":"Victoria Day","description":"Victoria Day is celebrated in honor of the birthdays of both Queen Victoria and the current monarch of Canada.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-05-18","datetime":{"year":2020,"month":5,"day":18}},"type":["National holiday"],"locations":"All except NS, PE, QC","states":[{"id":57,"abbrev":"AB","name":"Alberta","exception":null,"iso":"ca-ab"},{"id":58,"abbrev":"BC","name":"British Columbia","exception":null,"iso":"ca-bc"},{"id":59,"abbrev":"MB","name":"Manitoba","exception":null,"iso":"ca-mb"},{"id":60,"abbrev":"NB","name":"New Brunswick","exception":null,"iso":"ca-nb"},{"id":61,"abbrev":"NL","name":"Newfoundland and Labrador","exception":null,"iso":"ca-nl"},{"id":62,"abbrev":"NT","name":"Northwest Territories","exception":null,"iso":"ca-nt"},{"id":64,"abbrev":"NU","name":"Nunavut","exception":null,"iso":"ca-nu"},{"id":65,"abbrev":"ON","name":"Ontario","exception":null,"iso":"ca-on"},{"id":68,"abbrev":"SK","name":"Saskatchewan","exception":null,"iso":"ca-sk"},{"id":69,"abbrev":"YT","name":"Yukon","exception":null,"iso":"ca-yt"}]},{"name":"Canada Day","description":"Canada Day is a federal holiday on July 1 to mark the anniversary of the date that Canada became a self-governing country.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-07-01","datetime":{"year":2020,"month":7,"day":1}},"type":["National holiday"],"locations":"All","states":"All"},{"name":"Labour Day","description":"Labour Day in Canada is a holiday to campaign for workers\' rights. It celebrates the achievements of these rights.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-09-07","datetime":{"year":2020,"month":9,"day":7}},"type":["National holiday"],"locations":"All","states":"All"},{"name":"Thanksgiving Day","description":"Thanksgiving Day is a holiday to give thanks for the blessings in one\'s life, particularly the harvest. It is a day off work for many Canadians.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-10-12","datetime":{"year":2020,"month":10,"day":12}},"type":["National holiday"],"locations":"All except NB, NS, PE","states":[{"id":57,"abbrev":"AB","name":"Alberta","exception":null,"iso":"ca-ab"},{"id":58,"abbrev":"BC","name":"British Columbia","exception":null,"iso":"ca-bc"},{"id":59,"abbrev":"MB","name":"Manitoba","exception":null,"iso":"ca-mb"},{"id":61,"abbrev":"NL","name":"Newfoundland and Labrador","exception":null,"iso":"ca-nl"},{"id":62,"abbrev":"NT","name":"Northwest Territories","exception":null,"iso":"ca-nt"},{"id":64,"abbrev":"NU","name":"Nunavut","exception":null,"iso":"ca-nu"},{"id":65,"abbrev":"ON","name":"Ontario","exception":null,"iso":"ca-on"},{"id":67,"abbrev":"QC","name":"Quebec","exception":null,"iso":"ca-qc"},{"id":68,"abbrev":"SK","name":"Saskatchewan","exception":null,"iso":"ca-sk"},{"id":69,"abbrev":"YT","name":"Yukon","exception":null,"iso":"ca-yt"}]},{"name":"Remembrance Day","description":"Remembrance Day commemorates civilians and military personnel who lost their lives in armed conflicts.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-11-11","datetime":{"year":2020,"month":11,"day":11}},"type":["National holiday"],"locations":"All except MB, NS, ON, QC","states":[{"id":57,"abbrev":"AB","name":"Alberta","exception":null,"iso":"ca-ab"},{"id":58,"abbrev":"BC","name":"British Columbia","exception":null,"iso":"ca-bc"},{"id":60,"abbrev":"NB","name":"New Brunswick","exception":null,"iso":"ca-nb"},{"id":61,"abbrev":"NL","name":"Newfoundland and Labrador","exception":null,"iso":"ca-nl"},{"id":62,"abbrev":"NT","name":"Northwest Territories","exception":null,"iso":"ca-nt"},{"id":64,"abbrev":"NU","name":"Nunavut","exception":null,"iso":"ca-nu"},{"id":66,"abbrev":"PE","name":"Prince Edward Island","exception":null,"iso":"ca-pe"},{"id":68,"abbrev":"SK","name":"Saskatchewan","exception":null,"iso":"ca-sk"},{"id":69,"abbrev":"YT","name":"Yukon","exception":null,"iso":"ca-yt"}]},{"name":"Christmas Day","description":"Christians celebrate the birth of Jesus Christ on Christmas Day in Canada.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-12-25","datetime":{"year":2020,"month":12,"day":25}},"type":["National holiday","Christian"],"locations":"All","states":"All"},{"name":"Boxing Day","description":"The day after Christmas Day is known as Boxing Day and is a holiday in many parts of Canada.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-12-26","datetime":{"year":2020,"month":12,"day":26}},"type":["National holiday"],"locations":"NB, NL, NT, NU, ON","states":[{"id":60,"abbrev":"NB","name":"New Brunswick","exception":null,"iso":"ca-nb"},{"id":61,"abbrev":"NL","name":"Newfoundland and Labrador","exception":null,"iso":"ca-nl"},{"id":62,"abbrev":"NT","name":"Northwest Territories","exception":null,"iso":"ca-nt"},{"id":64,"abbrev":"NU","name":"Nunavut","exception":null,"iso":"ca-nu"},{"id":65,"abbrev":"ON","name":"Ontario","exception":null,"iso":"ca-on"}]}]}}');
            System.assertEquals(res, expectedValue);
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
    }

    @isTest
    public static void getNoFavoriteListTest() {
        Profile standardProfile = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User noFavoritesUser = new User(Alias = 'fooTest', Email='noFavorites@fooTest.com', 
            EmailEncodingKey='UTF-8', FirstName='No', LastName='favs', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = standardProfile.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='noFavorites@fooTest.com',
            favorite_holidays__c = null
            );
        System.runAs(noFavoritesUser) {
            String holidays = CalendarController.getFavoriteList();
            System.assert(!String.isNotEmpty(holidays));

        }

    }

    @isTest
    public static void getFavoriteListTest() {
        Profile standardProfile = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User yesFavoritesUser = new User(Alias = 'fooTest', Email='noFavorites@fooTest.com', 
            EmailEncodingKey='UTF-8', FirstName='No', LastName='favs', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = standardProfile.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='noFavorites@fooTest.com',
            favorite_holidays__c = '[{"name":"New Year\'s Day","description":"New Year\'s Day is the first day of a new year according to the Gregorian calendar used in Canada and many other countries.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-01-01","datetime":{"year":2020,"month":1,"day":1}},"type":["National holiday"],"locations":"All","states":"All"}]'
            );
        System.runAs(yesFavoritesUser) {
            String holidays = CalendarController.getFavoriteList();
            System.assert(String.isNotEmpty(holidays));
        }

    }

    @isTest
    public static void updateFavoriteListTest(){
        Profile standardProfile = [SELECT Id FROM Profile WHERE Name='Standard User']; 

        User noFavoritesUser = new User(Alias = 'fooTest', Email='noFavorites@fooTest.com', 
            EmailEncodingKey='UTF-8', FirstName='No', LastName='favs', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = standardProfile.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='noFavorites@fooTest.com',
            favorite_holidays__c = null
            );

        string newYearsFavorite = '[{"name":"New Year\'s Day","description":"New Year\'s Day is the first day of a new year according to the Gregorian calendar used in Canada and many other countries.","country":{"id":"ca","name":"Canada"},"date":{"iso":"2020-01-01","datetime":{"year":2020,"month":1,"day":1}},"type":["National holiday"],"locations":"All","states":"All"}]';
        
        System.runAs(noFavoritesUser) {

            String holidays = CalendarController.updateFavoriteList(newYearsFavorite);
            User currentUser = [SELECT id, favorite_holidays__c from User where id =:UserInfo.getUserId()];
            System.assertEquals('Success: Favorite List updated successfully', holidays);
            System.assertEquals(currentUser.favorite_holidays__c, newYearsFavorite);
        }
    }

    @isTest
    public static void updateFavoriteListNullTest(){
        Profile standardProfile = [SELECT Id FROM Profile WHERE Name='Standard User']; 

        User noFavoritesUser = new User(Alias = 'fooTest', Email='noFavorites@fooTest.com', 
            EmailEncodingKey='UTF-8', FirstName='No', LastName='favs', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = standardProfile.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='noFavorites@fooTest.com',
            favorite_holidays__c = null
            );
        
        System.runAs(noFavoritesUser) {

            String holidays = CalendarController.updateFavoriteList(null);
            User currentUser = [SELECT id, favorite_holidays__c from User where id =: UserInfo.getUserId()];
            System.assertNotEquals('Success: Favorite List updated successfully', holidays);
            System.assertEquals('nothing to update', holidays);
            System.assertEquals(true, String.isEmpty(currentUser.favorite_holidays__c));
        }

    }

}
