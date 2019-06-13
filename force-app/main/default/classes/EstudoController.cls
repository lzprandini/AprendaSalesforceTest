public with sharing class EstudoController {
    
    public String idProva                   {get; set;}
    public List<Pergunta__c> lstPergunta    {get; set;}
    public List<Opcoes__c> lstOpc           {get; set;}
    public List<Prova__c> lstProva          {get; set;}

    public EstudoController() {
        lstOpc          = new List<Opcoes__c>();
        lstPergunta     = new List<Pergunta__c>();
        lstProva        = new List<Prova__c>();
        lstProva = ProvaDAO.getProvas();
        
    }

    // Pegar as Perguntas
    public void pegaPerguntas(){
        
        List<String> lstPerguntaId = new List<String>();

        // Pega qual foi a prova escolhida
         

        // faz a query 
        lstPergunta = PerguntaDAO.getPerguntasPorProva(idProva);
        
        for(Pergunta__c itemPerg : lstPergunta){
            lstPerguntaId.add(itemPerg.Id);
        }

        lstOpc = OpcaoDAO.getOpcoesPorListaDePergunta(lstPerguntaId); 
               
        // retorna
    }

    // public class pergunta{

    //     public Pergunta__c perguntaS {get; set;}

    // }

    // public class resposta{
  
    //     public Opcoes__c opcao {get; set;}
        

    // }

}
