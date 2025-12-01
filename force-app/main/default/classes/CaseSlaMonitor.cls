global class CaseSlaMonitor implements Schedulable {
    global void execute(SchedulableContext sc){
        List<case> caseToUpdate = [SELECT Id,SLA_Due_Date__c,Escalation_Flag__c from Case
                                  WHERE Status != 'Closed'
                                  AND SLA_Due_Date__c != NULL
                                  AND Escalation_Flag__c = FALSE
                                  ];
        system.debug('Case to Update' + caseToUpdate );
        Datetime nowTime = System.now();
        system.debug('Case Time' + nowTime );
        
        
        for(Case c:caseToUpdate){
            
            if(c.SLA_Due_Date__c.getTime() - nowTime.getTime() <= (2*60*60*1000)){
                
                c.Escalation_Flag__c = True;
            }
            
        }
        
        if(!caseToUpdate.isEmpty()){
            
            update caseToUpdate;
        }
        
        
    }
}