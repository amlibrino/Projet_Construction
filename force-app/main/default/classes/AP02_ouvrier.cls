public with sharing class AP02_ouvrier {
    public AP02_ouvrier() {
    }

public static void envoyerMail(List<Contact> contactList) {
    List<Contact> executantList = [SELECT Owner.Email, Date_de_fin_du_Contrat__c FROM Contact WHERE ID IN : contactList];
    
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();

    for (Contact c: executantList)
    {
        List<String> ownerAddresses = new List<String>();

        if (c.Date_de_fin_du_Contrat__c != null)
        {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setSubject('Mon sujet de email');
            message.plaintextbody = 'blablablablablablablablablablablablablablablablablablablablablablablabla';
            message.optoutpolicy = 'FILTER';
            ownerAddresses.add(c.Owner.Email);
            
            message.toaddresses = ownerAddresses;
            // Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
            mails.add(message);    
        }
    }
    try {
        Messaging.sendEmail(mails);
    } catch (Exception e) {
        System.debug(e.getMessage());
    }
}
}

