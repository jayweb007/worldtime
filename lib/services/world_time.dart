import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  late String time;
  String flag;
  late bool isDayTime;

  WorldTime({required this.url, required this.location, required this.flag});

  Future<void> getData() async {
    // Await the http get response, then decode the json-formatted response.
    try {
      var response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var date = jsonResponse['datetime'];
      DateTime newDate = DateTime.parse(date);
      var offset = jsonResponse['utc_offset'].substring(1, 3);
      newDate = newDate.add(Duration(hours: int.parse(offset)));

      isDayTime = newDate.hour > 6 && newDate.hour < 20 ? true : false;
      time = DateFormat.jm().format(newDate);

      //
    } catch (e) {
      print('ERROR status => $e.');
      time = 'can not get Time';
    }
  }
}
