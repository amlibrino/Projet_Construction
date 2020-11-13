Batiment__c bat = new Batiment__c();
bat.name = 'bababababab';
bat.Village_Associe__c = 'a0009000002B3H1AAK';
insert bat;
AP01_Batiment.attacherIngenieur(new List<Batiment__c> {bat});