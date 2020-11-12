trigger BatimentTrigger on Batiment__c (before insert) {
    AP01_Batiment.attacherIngenieur(Trigger.new);
}