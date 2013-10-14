part of contacts;

class Contact extends ConceptEntity<Contact> {
  
  var NoCont, prenom, nom, email, tel, adresse;
  
  Contact newEntity() => new Contact();
  
}

class Contacts extends ConceptEntities<Contact> {

  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();

}