public with sharing class DmlClass {
    public DmlClass() {
        Account acc = new Account();
        acc.Name = 'Aula Dml';
        insert(acc); 
       Account accUpdate = [SELECT id,Name from Account Where Name = 'Aula Dml'];
       accUpdate.Type = 'Aula';
       update(accUpdate);

    }
}