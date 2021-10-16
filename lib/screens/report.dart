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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      drawer: const DrawerTifac(),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: _report.success == 0
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
        builder: (builder) => ReportPage(report: report,),
      ),
    );
  }
}
