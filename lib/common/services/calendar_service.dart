import 'package:http/http.dart' as http;

class CalendarService {
  Future<Object> getCalendar() async {
    var url = 'https://json.volotea.com/dist/schedule/ALC-NTE_schedule.json';

    var data = await http.get(url);
    print(data);
  }
}
