import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

setPunchData(data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('punchData', data);
  prefs.setString('punchDate', DateFormat('dd-MMM-yyyy').format(DateTime.now()));
}

Future<String?> getPunchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? punchDate = prefs.getString('punchDate');
  String? stringValue = prefs.getString('punchData');
  if(punchDate != DateFormat('dd-MMM-yyyy').format(DateTime.now())) {
    stringValue = null;
  }
  return stringValue;
}

removePunchData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("punchData");
  prefs.remove("punchDate");
}