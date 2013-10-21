
part of contacts;

class ProjectModel extends ConceptModel {
   
  var testsup=0;
  var AddMaj=0; //AddMaj=0 Ajout, 1=Mise a jour du contact 
  //static final String contact = 'contact';

  Map<String, ConceptEntities> newEntries() {
    //var contacts = new Contacts();
    //var map = new Map<String, ConceptEntities>();
    //map[contact] = contacts;
    //return map;
  }
  
  
  //Contacts get contacts => getEntry(contact);
  
  //var listContacts = new List();
  var listContacts = new Contacts();
  
  init() {
    
    //initialisation de liste de contact avec 3 contacts
    
    var cont1 = new Contact();
    cont1.NoCont="1";
    cont1.prenom="Aurelien";
    cont1.nom="BETBEUI";
    cont1.email="aurel_kb@live.fr";
    cont1.tel="418 929-0721";
    cont1.adresse="2593 rue vendée Québec QC";    
    listContacts.add(cont1);
    
    var cont2 = new Contact();
    cont2.NoCont="2";
    cont2.prenom="Mich";
    cont2.nom="NOUKAM";
    cont2.email="nmich@yahoo.fr";
    cont2.tel="581 445-5674";
    cont2.adresse="7654 boulevard laurier Québec QC";    
    listContacts.add(cont2);
    
    var cont3 = new Contact();
    cont3.NoCont="3";
    cont3.prenom="Teddy";
    cont3.nom="DESCHAMPS";
    cont3.email="tdeschamps@gmail.com";
    cont3.tel="418 765-3345";
    cont3.adresse="657 rue serine Québec QC";    
    listContacts.add(cont3);
    
           
  }
  
  display() {
    
    //List<ButtonElement> btsup = new List();
    //var compte=0;
    
    String list = '''<table width="100%" border="1" cellspacing="0" cellpadding="0" align="center">
                     <tr><td>N°</td><td>Prénom</td><td>Nom</td><td>Email</td><td>Téléphone</td><td>Adresse</td><td>Modifier</td><td>Supprimer</td></tr>''';
    var affcontact;
    for (var listcon in listContacts) {
      
                        
      affcontact = '''
                       <tr>
                        <td>${listcon.NoCont}</td>
                        <td>${listcon.prenom}</td>
                        <td>${listcon.nom}</td>
                        <td>${listcon.email}</td>
                        <td>${listcon.tel}</td>
                        <td>${listcon.adresse}</td>
                        <td align="center"><button type="button"><img id="btmod${listcon.NoCont}" src="../img/edit.gif" title="${listcon.NoCont}" /></button></td>
                        <td align="center"><button type="button"><img id="btsup${listcon.NoCont}" src="../img/delete.gif" title="${listcon.NoCont}" /></button></td>
                       </tr>''';
      
    list = '$list ${affcontact}';
         
    //compte=compte+1;
  }
    affcontact='''</table>''';
    list = '$list ${affcontact}';
         
  // the HTML library defines a global "document" variable
  document.query('#affcontacts').innerHtml = list;
  //query('#33').onClick.listen(remove);
  for(var i in listContacts){
    var idele="#btsup"+i.NoCont;
    var idc="#btmod"+i.NoCont;
    //print('${idele}');
    query(idele).onClick.listen(remove);
    query(idc).onClick.listen(update);    
  }
  
}
 
  
  evenBtAjout(){
    AddMaj=0;
    query('#ajouter').onClick.listen(add);
    //var listCount= listContacts.length;
    //query("#num").text = listCount+1;
  }
      
  add(MouseEvent event){
    
    if(AddMaj==0){
      
      //Validation d'ajout d'un contact
      
      InputElement num = query("#num");
      InputElement prenom = query("#prenom");
      InputElement nom = query("#nom");
      InputElement email = query("#email");
      InputElement tel = query("#tel");
      TextAreaElement adresse = query("#adresse");
      LabelElement message = query("#message");
      var error = false;
      message.text = '';
      
      if (num.value.trim() == '') {
        message.text = 'champ numéro requis; ${message.text}';
        error = true;
      }
      if (prenom.value.trim() == '') {
        message.text = 'champ prenom requis; ${message.text}';
        error = true;
      }
      if (nom.value.trim() == '') {
        message.text = 'champ nom requis; ${message.text}';
        error = true;
      }
      if (email.value.trim() == '') {
        message.text = 'champ email requis; ${message.text}';
        error = true;
      }
      if (tel.value.trim() == '') {
        message.text = 'champ téléphone requis; ${message.text}';
        error = true;
      }
      if (adresse.value.trim() == '') {
        message.text = 'champ adresse requis; ${message.text}';
        error = true;
      }
      if (!error) {
        
        var newContact = new Contact();
        newContact.NoCont=num.value;
        newContact.prenom=prenom.value;
        newContact.nom=nom.value;
        newContact.email=email.value;
        newContact.tel=tel.value;
        newContact.adresse=adresse.value;  
        
        listContacts.add(newContact);
        
        display();
        
        message.text = 'Ajouter effectué; ${message.text}';  
        
        query("#num").value="";
        query("#prenom").value="";
        query("#nom").value="";
        query("#email").value="";
        query("#tel").value="";
        query("#adresse").value="";
        
      }
    }else{
      
      //validation modification d'un contact
      
      InputElement num = query("#num");
      InputElement prenom = query("#prenom");
      InputElement nom = query("#nom");
      InputElement email = query("#email");
      InputElement tel = query("#tel");
      TextAreaElement adresse = query("#adresse");
      LabelElement message = query("#message");
      var error = false;
      message.text = '';
      
      var majContact = listContacts.find(num.value);
      //majContact.NoCont=num.value;      
      majContact.prenom=prenom.value;
      majContact.nom=nom.value;
      majContact.email=email.value;
      majContact.tel=tel.value;
      majContact.adresse=adresse.value;  
      
      listContacts.add(majContact);
      display();      
      message.text = 'Mise a jour effectuée; ${message.text}'; 
      
      AddMaj=0;
      
      query("#num").value="";
      query("#prenom").value="";
      query("#nom").value="";
      query("#email").value="";
      query("#tel").value="";
      query("#adresse").value="";
      
    }
  }
  
  
//Fonction Mise a jour d'un contact
  
  update(MouseEvent event){
    
    AddMaj=1;
       
    var id=(event.target as ImageElement).title;
    
    var cont = listContacts.find(id.toString());
   
    //window.alert(cont.NoCont + " - " + cont.prenom + " - " + cont.nom + " - " + cont.email + " - " + cont.tel + " - " + cont.adresse);

    query("#num").value=cont.NoCont;
    query("#prenom").value=cont.prenom;
    query("#nom").value=cont.nom;
    query("#email").value=cont.email;
    query("#tel").value=cont.tel;
    query("#adresse").value=cont.adresse;
      
  }

//Fonction Suppression d'un contact
  
remove(MouseEvent event) {
      
      var id=(event.target as ImageElement).title;
       
      if(window.confirm("Voulez vous supprimer ce contact?!!")){
        
        LabelElement message = query("#message");
        message.text = '';
        var cont = listContacts.find(id.toString());
        listContacts.remove(cont);
        display();  
        message.text = 'Suppression effectuée; ${message.text}';
        
      }      
      
  }
    
}