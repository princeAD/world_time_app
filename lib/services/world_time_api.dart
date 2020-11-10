import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:worldtimeapp/services/world_time.dart';

Future<Iterable> initiate() async {
  var client = Client();
  Response response = await client.get(
    'http://worldtimeapi.org/timezones'
  );
  var document = parse(response.body);
  List <Element> links = document.querySelectorAll("a[title ^= 'View timezone details for ']");

  List <WorldTime> linkMap = [];
  WorldTime app;
  String flg;
  for (var link in links) {
    String text = "";
    List t = link.text.split('/');
    for(var state in t){

      if(text == ""){
        text = text + state ;
      }else
        {text = text + "-" + state;}
    }
    if(t[0] == "America"){flg="assets/america.jpg";}
    else{flg= "assets/arrow.jpg";}
    app= WorldTime(location: text ,flag: flg ,url: link.attributes['href']);
    linkMap.add(app);
  }
  print(linkMap.length);
  return linkMap;
}