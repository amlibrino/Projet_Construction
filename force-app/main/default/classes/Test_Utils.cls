
@isTest
public class Test_Utils {

    public static Contact createContact(Contact c){

        return c;
    } 

    public static Contact createContact(Id contactId, String contactLastName) {
        Contact c = new Contact();
        c.LastName = 'Test contact LastName';
        Date d = Date.newInstance(2020,12,25);
        c.Date_de_fin_du_Contrat__c = d;
        insert c;
        return c;
    }

}
