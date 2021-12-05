import 'package:flutter/material.dart';
import 'package:tifac/screens/report_display.dart';
import 'package:tifac/services/report_services.dart';
import 'package:tifac/models/reportmodel.dart';
import 'utilities/drawer.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  ReportModel _report = ReportModel(success: 0, reports: []);
  bool _loading = false;
  Widget appBarTitle = const Text(
    "Reports",
  );
  final TextEditingController _controller = new TextEditingController();
  List<Report> _list = [];
  Icon icon = const Icon(
    Icons.search,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    _loading = true;
    ReportServices.getReports().then((reports) {
      setState(() {
        _report = reports;
        print("${_report.success} ${reports.success}");
        _loading = false;
      });
    });
    ReportServices.getReportNames().then((reports) {
      setState(() {
        _list = reports;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromRGBO(219, 115, 14, 1),
        backgroundColor: Colors.white,
        title: appBarTitle,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/TIFAC_Mobile_Application/Background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: (_report.success == 0)
                  ? Text("Error Capturing Reports")
                  : ListView.builder(
                      itemCount: _report.reports.length,
                      itemBuilder: (context, index) {
                        Report report = _report.reports[index];
                        return ListTile(
                          title: Text(report.reportname),
                          subtitle: Text(report.price),
                          leading: Image.network(report.reportimagepath),
                          onTap: () {
                            _OpenReport(context, report);
                          },
                        );
                      },
                    ),
            ),
    );
  }

  void _OpenReport(BuildContext context, Report report) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => ReportPage(
          report: report,
        ),
      ),
    );
  }
}
