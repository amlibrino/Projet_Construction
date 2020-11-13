public with sharing class ControllerClient_MethodeDeux {
    public List<Client__c> listClient{ get; set;}
    public Decimal totalSomme{get; set;}
    public ControllerClient_MethodeDeux() {
            totalSomme = 0;
            listClient = [SELECT Name,Prenom__c, Numero_d_appartement_Achet__c, Date_d_achat__c, 
                         Batiment__r.Name,Somme_payee__c FROM Client__c];
            
                        for (Client__c c : listClient) {
                            if (c.Somme_payee__c != null) {
                                totalSomme += c.Somme_payee__c;
                            }                    
                        }
    }
}
