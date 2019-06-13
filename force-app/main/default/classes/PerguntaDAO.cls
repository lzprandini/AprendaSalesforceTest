public with sharing class PerguntaDAO {
    public PerguntaDAO(){}

    public static List<Pergunta__c> getPerguntasPorProva(String idProva){
        return [SELECT   CreatedById,
                                CreatedDate,
                                Id,
                                IsDeleted,
                                LastModifiedById,
                                LastModifiedDate,
                                LastReferencedDate,
                                LastViewedDate,
                                Name,
                                PerguntaEN__c,
                                PerguntaPT__c,
                                Prova__c,
                                SystemModstamp 
                            FROM Pergunta__c
                            WHERE Prova__c =: idProva]; 
    }
}
