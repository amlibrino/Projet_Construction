@isTest
public class Test_Utils {
    public static Contact createContact() {
        Contact c = new Contact();
        c.LastName = 'Test contact LastName';
        Date d = Date.newInstance(2020,12,25);
        c.Date_de_fin_du_Contrat__c = d;
        insert c;
        return c;
    }

    public static Contact updateContact() {
        Contact c = new Contact();
        c.LastName = 'Test contact LastName';   
        insert c;
        Date d = Date.newInstance(2020,12,30);
        c.Date_de_fin_du_Contrat__c = d;
        update c;
        return c;
    }

    public static Account createIngenieur() {
        Account a = new Account();
        a.Name = 'TestAccount';
        insert a;
        return a;
    }

    public static Batiment__c createBatiment() {
        Batiment__c b = new Batiment__c();
        b.Name = 'Test';
        b.Village_Associe__c = 'a00090000023EY3AAM';
        insert b;
        return b;

    }
}