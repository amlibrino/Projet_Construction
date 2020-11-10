public with sharing class AP02_ouvrier {
    public AP02_ouvrier() {

    }

public static void envoyerMail(List<Contact> contactList, Map<Id,Contact> contactOldMap) {
    List<Contact> executantList = [SELECT Owner.Email FROM Contact WHERE ID IN : contactList];
    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
    message.setSubject('Mon sujet de email');
    message.plaintextbody = 'blablablablablablablablablablablablablablablablablablablablablablablabla';
    message.optoutpolicy = 'FILTER';
    List<String> ownerAddresses = new List<String>();
    for (Contact c: executantList)
    {
        if (c.Date_de_fin_du_Contrat__c != null && c.Date_de_fin_du_Contrat__c != contactOldMap.get(c.Id).Date_de_fin_du_Contrat__c)
        {
            ownerAddresses.add(c.Owner.Email);
            ownerAddresses.add('alexistl.ly@gmail.com');
        }
    }
    if (ownerAddresses.size() > 0)
    {
        message.toaddresses = ownerAddresses;
        // Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        mails.add(message);
        Messaging.sendEmail(mails);
    }
}
}

