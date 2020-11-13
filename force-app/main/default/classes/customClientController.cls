public class customClientController {
    public customClientController() {
    }

    // Represents the main Client list
    public List<Client__c> ClientList {
        get {
            if (ClientList == null) {
                ClientList = new List<Client__c>();
                for (Client__c Client : [SELECT Name,Prenom__c, Numero_d_appartement_Achet__c,
                                                Date_d_achat__c, Batiment__r.Name,Somme_payee__c
                                           FROM Client__c]) {
                    ClientList.add((Client));
                }
            }
            return ClientList;
        }
        set;
    }

   public Decimal total
    {
        get
        {
            Decimal total = 0.0;
            for (Client__c c: ClientList)
            {
                total += c.Somme_payee__c;
            }
            return total;
        }
        set;
    }
}

/*
    public static Decimal calculTotal{
        get{
            Decimal total = 0;
            for (Client__c c: ClientList) {
                total += Somme_payee__c;
                }
            return total;  
        }
        }      
    }
    // Wrapper class
    public class ClientWrapper {
        public Client__c Client {get; set;}
        public Boolean checked {get; set;}

        public ClientWrapper(Client__c c) {
            Client = c;
            checked = false;
        }
    }
    public PageReference newSearch() {
        PageReference newPage = Page.VFP01_InformationsVentes;
        newPage.setRedirect(true);
        return newPage;
    }

    //barre de recharche 
    public String searchText {
        get {
            return searchText;
        }
        set {
            searchtext = value;
        }
    }

    public Boolean searched {get; set;}                             // Indicates whether search has been done
    public ApexPages.StandardSetController setCon { get; set; }     // Standard Set Controller

*/


