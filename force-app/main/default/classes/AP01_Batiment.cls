public with sharing class AP01_Batiment {
    public AP01_Batiment() {
    }
    public static void attacherIngenieur(List<Batiment__c> listBat){
        List<Account> listIngenieur = new List<Account>();
        //costum label ()
        Id RecordType = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Personnel').getRecordTypeId();

        Map<Id, Account> mapBatimentAccount = new Map<Id, Account>();
        if (listBat != null) {
            for(Batiment__c bat : listBat){
                if(bat.Ingenieur_de_Realisation__c == null){
                    Account ingenieurToInsert = new Account(Name = bat.Name + 'Account' + bat.Village_Associe__r + 'village'
                                         , RecordTypeId = RecordType,
                                         Nombre_d_annees_d_experiences__c =5,
                                         Date_de_demarrage_du_Contrat__c = date.today());

                    listIngenieur.add(ingenieurToInsert);
                    mapBatimentAccount.put(bat.Id, ingenieurToInsert);    
                }
            }
            if (listIngenieur != null && listIngenieur.size() > 0) {
                try {
                    insert listIngenieur;
                for (Batiment__c bat : listBat) {
                    bat.Ingenieur_de_Realisation__c = mapBatimentAccount.get(Bat.id).id;
                }  
                   // Database.update(listBat); l'update se fait directement par la trigger
                } catch (Exception e) {
                    System.debug(e.getMessage());
                }
            }   
        }

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
