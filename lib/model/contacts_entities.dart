part of contacts;

class Contact extends ConceptEntity<Contact> {
  
  var NoCon, prenom, nom, email, tel, adresse;
  
  String get NoCont => NoCon;
  set NoCont(String name) {
    NoCon = name;
    if (code == null) {
      code = name;
    }
  }
  
  /*String _name;
  String etat;
  
  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  }*/
  
  Contact newEntity() => new Contact();
  
}

class Contacts extends ConceptEntities<Contact> {

  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();

}