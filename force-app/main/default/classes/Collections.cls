public with sharing class Collections {
    public Collections() {
      List<String> myList = new List<String>();
      myList.add('Ronaldo');
      myList.add(0, 'Ronaldinho');
  
      for (String s : myList) {
        system.debug(s);
      }
      System.debug(myList.contains('Ronaldinho'));
  
      if (!myList.isEmpty()) {
        System.debug('Sua lista nao está vazia');
      }
      System.debug(myList.size());
  
      for (Integer i = 0; i < myList.size(); i++) {
    System.debug(myList[i]);
      }
    }

    public void MysetList(){
        Set<String> mySet = new Set<String>();


    }

    public void MyMap(){
        Map<String, String> mapName = new Map<String, String>();
        //Adicionar valor

        mapName.put('Chave', 'Valor');
        mapName.put('Chave2', 'Valor');

        //Verifica se o valor está dentro da lista
       if( mapName.containskey('Chave')){
        System.debug('Já Existe');
       }

       //Pegar todas as chaves
       System.debug(mapName.keySet());

       //Pega os valores
       System.debug(mapName.values());
    }
  }