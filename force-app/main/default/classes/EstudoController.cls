    public with sharing class EstudoController {
        
        public List<Pergunta__c> lstPergunta                {get; set;}
        public List<Opcoes__c> lstOpc                       {get; set;} 
        public List<Prova__c> lstProva                      {get; set;}
        public List<pergunta> lstPerguntasW                 {get; set;}
        public Map<String, List<Opcoes__c>> mapPergunta     {get; set;}

        public String idProva                               {get; set;}
        public String idLanguage                            {get; set;}
        
        public Boolean showLanguage                         {get; set;}
        public Boolean showTest                             {get; set;}
        public Boolean startExam                            {get; set;}

        public EstudoController() {
            lstOpc          = new List<Opcoes__c>();
            lstPergunta     = new List<Pergunta__c>();
            lstProva        = new List<Prova__c>(); 
            lstPerguntasW   = new List<pergunta>();
            mapPergunta     = new Map<String, List<Opcoes__c>>();
            idProva         = 'a024P00000mVqOwQAK';  
            lstProva        = ProvaDAO.getProvas();

            showLanguage    = true;
            showTest        = false;
            startExam       = false;

            pegaPerguntas(); 
        }
        
        public void mostrarRelatorio(){
            //Encaminhar para página ReportExam
        }

        public void selectLanguage(){


            showLanguage    = true;
            showTest        = false;
            startExam       = false;

        }
        
        public void selectProva(){
            
            showLanguage    = true;
            showTest        = false;
            startExam       = false;
        }

        public void startTest(){
            
            showLanguage    = true;
            showTest        = false;
            startExam       = false;

        }

        public void nextQuestion(){
            // Adicionar contador
        } 

        // Pegar as Perguntas
        public void pegaPerguntas(){
            Map<String, List<Opcoes__c>> mapPergunta    = new Map<String, List<Opcoes__c>>();
            List<String> lstPerguntaId                  = new List<String>();
            Map<String, Pergunta__c> mapPergun          = new Map<String, Pergunta__c>();

            // Pega qual foi a prova escolhida


            // faz a query de pergunta aleatória
            lstPergunta = PerguntaDAO.getPerguntasPorProva(idProva);
            System.debug('lstPergunta&&'+lstPergunta);
            for(Pergunta__c itemPerg : lstPergunta){
                lstPerguntaId.add(itemPerg.Id);
                mapPergun.put(itemPerg.Id, itemPerg);
            }

            lstOpc = OpcaoDAO.getOpcoesPorListaDePergunta(lstPerguntaId); 
            System.debug('lstPergunta&&'+lstPergunta);

            for(Opcoes__c newUser : lstOpc) {
                if(mapPergunta.containsKey(newUser.Pergunta__c)) {
                    List<Opcoes__c> usersId = mapPergunta.get(newUser.Pergunta__c);
                    usersId.add(newUser);
                    mapPergunta.put(newUser.Pergunta__c, usersId);
                } else {
                    mapPergunta.put(newUser.Pergunta__c, new List<Opcoes__c>{ newUser });
                }
            } 
 
            System.debug('mapPergunta&&'+mapPergunta);
            
            for(String itemString : mapPergunta.keySet()){
                System.debug('itemString&&'+itemString); 

                pergunta newP   = new pergunta();
                newP.perguntaS  = mapPergun.get(itemString);
                newP.opcoes     = mapPergunta.get(itemString);
                lstPerguntasW.add(newP);
            }
        }
    }
