public with sharing class TiposdeDados {
    public TiposdeDados() {

        Blob b = Blob.valueOf('Eu sou um blob');
        System.debug(b.toString());//Base64

        Date data = Date.today();
        Date d2 = Date.today().addDays(-45);
        System.debug(data.dayOfYear());
        System.debug(d2.daysBetween(data));//diferença entre as datas
        DateTime data1 = DateTime.now();//Data e hora atual
        System.debug(data1.getTime());//Hora em segundos que tenho até a data especifica 1 jan de 1970 0:0:0
         //Por padrão o salesforce com gmt igual a zero ou seja sem timezone
         System.debug(data1.time());//somente o time da hora - tras a hora com timezone local
         System.debug(data1.timeGmt());//traz gmt 0

         Time myTime = Time.newInstance(18,30,2,20); //Informmo a hora

        
    }
}