@IsTest
public class CloseOpenOpportunitiesTest {

    @TestSetup
    static void makeData(){
        Account acc = new Account(
            Name = 'Acc Test',
            TargetCountry__c = 'United States',
            Phone = '11111111111'
        );
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Opp Test',
            AccountId = acc.Id,
            CloseDate = System.today().addDays(30),
            StageName = 'Prospecting',
            Pricebook2Id = Test.getStandardPricebookId()
        );
        insert opp;

    }
    @IsTest
    static void testCloseOpportunities(){

        Test.startTest();
            Database.executeBatch(new CloseOpenOpportunities());
        Test.stopTest();

        List<Opportunity> closedOpp = [SELECT Id FROM Opportunity WHERE StageName = 'Closed'];

        System.assert(!closedOpp.isEmpty());
    }
}
