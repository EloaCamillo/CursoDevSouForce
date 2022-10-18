public with sharing class SoqlClass {
    public SoqlClass() {
    
        [SELECT Id, Name, Type, BillingState
         FROM Account 
         Where Type IN ('Customer - Channel','Customer - Direct')
         Order By Name ASC
        ]
    
}
}
