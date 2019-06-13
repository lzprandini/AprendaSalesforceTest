public with sharing class OpcaoDAO {
    public OpcaoDAO(){}

    public static List<Opcoes__c> getOpcoesPorListaDePergunta(List<String> lstIdPerguntas){
        return [SELECT      CreatedById,
                            CreatedDate,
                            DescricaoEN__c,
                            DescricaoPT__c,
                            Id,
                            IsDeleted,
                            LastModifiedById,
                            LastModifiedDate,
                            Name,
                            Pergunta__c,
                            RespostaCerta__c,
                            SystemModstamp 
                        FROM Opcoes__c
                        WHERE Pergunta__c IN: lstIdPerguntas]; 
    }

}
