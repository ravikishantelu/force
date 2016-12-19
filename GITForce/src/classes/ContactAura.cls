public class ContactAura {
    @AuraEnabled
    public static List<Contact> apexMethod()
    {
        return [SELECT Id, NAME FROM Contact Limit 10] ;
    }
}