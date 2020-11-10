import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  int timeofDay;

  WorldTime({this.location, this.flag, this.url});
  Future<void> getData () async {

    try {
      Response response = await get('http://worldtimeapi.org/api$url');
      //print(response.body);
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      DateTime now = DateTime.parse(dateTime);
      int offset_int = int.parse(offset.substring(1,3));
      //print(now);
      if(offset[0] == '+') {
        now = now.add(Duration(hours: offset_int));
      }
      else {
        now = now.subtract(Duration(hours: offset_int));
      }
      //print(now);
      time = DateFormat.jm().format(now);
      timeofDay= now.hour;
      //set time property
    }
    catch(e){
      print('caught error: $e');
      time = 'could not get the data';
    }


  }
}