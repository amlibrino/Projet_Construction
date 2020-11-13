public with sharing class AP02_Batiment {
    public AP02_Batiment() {

    }
    // premiere façon ne pas passer une liste en parametre passer juste un seul enregistrement batiment 
    // partie 4 de l exo simulation 
    public static void attacherIngenieur (Id BatimentId){
        Batiment__c Bat = [ SELECT Id, Ingenieur_de_Realisation__c
                            FROM Batiment__c
                            WHERE Id=: BatimentId];
        RecordType ingenieurPersonnel = [SELECT Id FROM RecordType 
                                          WHERE SObjectType='Account' and developerName='Personnel'];
                                                                               
        if (Bat != null) {
            if (Bat.Ingenieur_de_Realisation__c == null) {
                Account newIngenieur = new Account();
                newIngenieur.RecordTypeId = ingenieurPersonnel.Id;
                newIngenieur.Name = 'ing1';
                newIngenieur.Nombre_d_annees_d_experiences__c =5;
                newIngenieur.Date_de_demarrage_du_Contrat__c = date.today();

                try {
                    insert newIngenieur;
                    Bat.Ingenieur_de_Realisation__c = newIngenieur.Id;
                    Database.update(Bat);
                } catch (Exception e) {
                    System.debug(e.getMessage());      
                }
            }
/*A partir du Console Développeur, créer une classe AP01_Batiment. Dans la classe créer
la méthode attacherIngenieur qui permet de créer/rattacher un Bâtiment à un Ingénieur
dans le cas où ce Bâtiment n’est pas rattaché à un Ingénieur.
Cette méthode doit être static, prend en paramètres l’ID d’un enregistrement de
Bâtiment et doit utiliser SOQL pour retrouver l’enregistrement du Bâtiment et les DML
pour créer un Ingénieur de type personnel et mettre à jour l’enregistrement de Bâtiment
pour le rattacher à l’Ingénieur créé.
La création doit utiliser la commande Standalone insert et la mise à jour doit utiliser la
méthode système Database.update. Pensez à gérer les Exceptions qui peuvent arriver en
utilisant les try/catch.
Tester votre méthode à partir de l’exécution Anonymous du Console Développeur et
examiner les résultats dans Salesforce.*/
        }

    }
}
