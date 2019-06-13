public with sharing class ProvaDAO {
    public ProvaDAO(){}

    public static List<Prova__C> getProvas(){
        return [SELECT  Id, 
                        Name 
                    FROM Prova__c];

    }
    

}
