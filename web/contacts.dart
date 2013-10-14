
import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:contacts/contacts.dart';

void main(){
  //query("#sample_text_id").text="Hello Word";
  ProjectModel projectmodel = new ProjectModel();
  projectmodel.init();
  projectmodel.display();
  projectmodel.evenBtAjout();
  //projectmodel.evenBtSupp();
       
}

/*void main() {
  query("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(reverseText);
}*/

/*void reverseText(MouseEvent event) {
  var text = query("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  query("#sample_text_id").text = buffer.toString();
}*/
