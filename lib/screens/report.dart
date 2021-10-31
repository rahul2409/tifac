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
    style: TextStyle(color: Colors.white),
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
        title: appBarTitle,
        actions: [
          IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                if (icon.icon == Icons.search) {
                  icon = const Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  appBarTitle = TextField(
                    controller: _controller,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white)),
                    onChanged: searchOperation,
                  );
                }
              });
            },
          )
        ],
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
  
  void searchOperation(String searchText) {
    //searchresult.clear();
    if (true) {//_isSearching != null
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i].reportname;
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          //searchresult.add(data);
        }
      }
    }
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
