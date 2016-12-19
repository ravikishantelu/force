public class DefaultErrorController {

    @AuraEnabled
    public static Id createRecord(Lead theLead) {
        insert theLead;
        return theLead.Id;
    }
}