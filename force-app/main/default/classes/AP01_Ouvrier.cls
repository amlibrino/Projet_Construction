public class AP01_Ouvrier {
    
    public static void envoyerEmail(Contact myexecutant) {
        // recuperer l'email
        Contact excutant = [SELECT Id, Owner.Email, Date_de_fin_du_Contrat__c FROM Contact WHERE Id = : myexecutant.Id ];
        //stocker l' email
        String ownerEmail = excutant.Owner.email;

        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        // Set recipients to two contact IDs.
        // Replace IDs with valid record IDs in your org.
        message.toAddresses = new String[] { ownerEmail };
        message.optOutPolicy = 'FILTER';
        message.subject = 'Bonjour  Test Message';
        message.plainTextBody = 'This is the message body. exo projet salesforce envoyer un mail dans une fonction';
        Messaging.SingleEmailMessage[] messages = 
            new List<Messaging.SingleEmailMessage> {message};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                + results[0].errors[0].message);
        }

    }
}

/*Cette classe doit contenir la méthode : envoyerEmail qui permet d’envoyer un Email au
propriétaire de l’ouvrier au moment où la Date de Fin du Contrat pour l’ouvrier change (durant la
création ou modification d’un ouvrier).
La méthode envoyerEmail doit être static et prend les paramètres suivants :
o Enregistrement ouvrier
La méthode doit utiliser SOQL pour récupérer l’adresse mail du propriétaire de l’exécutant
(l’utilisateur propriétaire) et doit implémenter Messaging.SingleEmailMessage[].
Tester votre méthode à partir de l’exécution Anonymous du Console Développeur et examiner les
résultats.*/

/*   exécuter en anonymous 

Contact myexecutant = [SELECT Id FROM Contact WHERE Id = '0034x000002JPMRAA4']; 
Contact excutant = [SELECT Id, Owner.Email, Date_de_fin_du_Contrat__c FROM Contact WHERE Id = : myexecutant.Id ];
    //stocker l' email
    String ownerEmail = excutant.Owner.email;

    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
    message.toAddresses = new String[] { ownerEmail,'rasiahstarlin@gmail.com', 'hamid.benchikh@gmail.com' };
    message.optOutPolicy = 'FILTER';
    message.subject = 'Bonjour  Test Message';
    message.plainTextBody = 'This is the message body. exo projet salesforce envoyer un mail dans une fonction';
    Messaging.SingleEmailMessage[] messages = 
        new List<Messaging.SingleEmailMessage> {message};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
    System.debug('The email was sent successfully dqsjkldjqskjdqskldjqskldklqsj.');
    if (results[0].success) {
        System.debug('The email was sent successfully.');
    } else {
        System.debug('The email failed to send: '
            + results[0].errors[0].message);
    }
    */