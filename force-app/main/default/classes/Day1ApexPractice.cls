public class Day1ApexPractice {
    public static void printOpportunityDetails(){
        
        List<Opportunity> oppList = [SELECT Name, StageName, Amount 
            FROM Opportunity 
            LIMIT 5
        ];

        for(Opportunity opp:oppList){
            
            system.debug('Opportunity:' +opp.Name + '|Stage:' +opp.StageName + '|Amount:' + opp.Amount
            
            );
        }
    }
    public static Integer getOpportunityCount() {
    return [SELECT COUNT() FROM Opportunity];
}
    public static List<Opportunity> getHighValueOpps() {
    return [
        SELECT Name, Amount 
        FROM Opportunity 
        WHERE Amount > 50000
    ];
}

}