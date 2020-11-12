trigger OuvrierTrigger on Contact (after insert, after update) {
    
    if (trigger.isInsert) {
        AP02_ouvrier.envoyerMail(trigger.new);   
    }
    if (trigger.isUpdate) {
        List<Contact> listContactDateChanger = new List<Contact>();
        
        for (Contact c : trigger.new) {
            if (trigger.oldMap.get(c.Id).Date_de_fin_du_Contrat__c != c.Date_de_fin_du_Contrat__c) {
                
                listContactDateChanger.add(c);
            }   
        }
        if (listContactDateChanger.size()>0) {
            AP02_ouvrier.envoyerMail(listContactDateChanger);      
        }       
    }
}