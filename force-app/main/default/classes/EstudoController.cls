public with sharing class EstudoController {
    
    public String idProva                   {get; set;}
    public List<Pergunta__c> lstPergunta    {get; set;}
    public List<Opcoes__c> lstOpc           {get; set;}
 

    public EstudoController() {
        lstOpc          = new List<Opcoes__c>();
        lstPergunta     = new List<Pergunta__c>();
    }

    // Pegar as Perguntas
    public void pegaPerguntas(){
        
        List<String> lstPerguntaId = new List<String>();

        // Pega qual foi a prova escolhida
        Prova__c prova = [SELECT Id, Name FROM Prova__c];
        // faz a query 
        lstPergunta = [SELECT   CreatedById,
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
                            WHERE Prova__c =: prova.Id];    
        
        for(Pergunta__c itemPerg : lstPergunta){
            lstPerguntaId.add(itemPerg.Id);
        }

        lstOpc = [SELECT    CreatedById,
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
                        WHERE Pergunta__c IN: lstPerguntaId]; 
        // retorna

    }

    // public class pergunta{

    //     public Pergunta__c perguntaS {get; set;}

    // }

    // public class resposta{
  
    //     public Opcoes__c opcao {get; set;}
        

    // }

}
