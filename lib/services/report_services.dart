import 'package:http/http.dart' as http;
import 'package:tifac/models/reportmodel.dart';

class ReportServices {
  static const String url = "https://tifac.wipurl.com/index.php/reports";
  static Future<ReportModel> getReports() async {
    ReportModel reports = ReportModel(reports: [], success: 0);
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        reports = reportModelFromJson(response.body);
        return reports;
      }
    } catch (err) {
      print("error processing api call");
    }
    return reports;
  }
}
